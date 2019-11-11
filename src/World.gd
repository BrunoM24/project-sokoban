extends Node2D

var wonPop : PopupMenu

onready var floorTile : TextureRect = $Floor

export var plataformsRequired := 2
var plataformsPlaced := 0

func _ready() -> void:
	wonPop = $CanvasLayer/WinPopup

	floorTile.rect_size = get_viewport_rect().size
	
	Events.connect("boxPlaced", self, "onBoxPlaced")
	Events.connect("gameWon", self, "onGameWon")


func onBoxPlaced() -> void:
	print("Box placed")
	plataformsPlaced += 1
	
	if plataformsPlaced >= plataformsRequired:
		Events.emit_signal("gameWon")


func onGameWon() -> void:
	print("GameWon")
	wonPop.popup()