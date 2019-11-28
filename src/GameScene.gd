extends Node2D

onready var wonPop := $CanvasLayer/WinPopup


func _ready() -> void:
	var scene : Resource = load(LevelManager.levels[LevelManager.currentLevel]["path"])
	
	add_child(scene.instance())
	
	Events.connect("gameWon", self, "onGameWon")


func onGameWon() -> void:
	print("GameWon")
	wonPop.popup()
