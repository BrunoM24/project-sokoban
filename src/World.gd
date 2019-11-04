extends Node2D

onready var wonPop : PopupMenu = $CanvasLayer/WinPopup

func _on_Platform_gameWon():
	wonPop.show()
