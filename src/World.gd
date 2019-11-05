extends Node2D

onready var wonPop : PopupMenu = $CanvasLayer/WinPopup
onready var floorTile : TextureRect = $Floor


func _ready() -> void:
	floorTile.rect_size = get_viewport_rect().size


func _on_Platform_gameWon() -> void:
	wonPop.show()
