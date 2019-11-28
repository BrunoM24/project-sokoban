extends Node2D
class_name BaseLevel

export(int, "Brick", "Wood", "Stone") var wallType
export(int, "Stone", "Grass", "Dirt") var floorType

export var plataformsRequired := 0
var plataformsPlaced := 0

onready var background : TextureRect = $Background
onready var tileMap : TileMap = $TileMap

var unlocked := false
var completed := false

func _ready():
	background.rect_size = get_viewport_rect().size
	tileMap.setWalls(wallType)
	tileMap.setFloor(floorType)
	
	Events.connect("boxPlaced", self, "onBoxPlaced")
	Events.connect("boxRemoved", self, "onBoxRemoved")


func onBoxPlaced() -> void:
	yield(get_tree().create_timer(1), "timeout")
	print("Box placed")
	plataformsPlaced += 1
	
	print("boxes placed: " + str(plataformsPlaced))

	if plataformsPlaced >= plataformsRequired:
		Events.emit_signal("gameWon")
		LevelManager.unlockNextLevel()


func onBoxRemoved() -> void:
	plataformsPlaced -= 1
	
	print("boxes placed: " + str(plataformsPlaced))
