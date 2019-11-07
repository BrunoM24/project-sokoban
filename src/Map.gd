extends Node2D

export(int, "Brick", "Wood", "Stone") var wallType
export(int, "Stone", "Grass", "Dirt") var floorType

onready var background : TextureRect = $Background
onready var tileMap : TileMap = $TileMap

func _ready():
	background.rect_size = get_viewport_rect().size
	tileMap.setWalls(wallType)
	tileMap.setFloor(floorType)
