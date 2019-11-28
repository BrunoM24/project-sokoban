extends Control

var levelButtonSelected : LevelButton

func _ready():
	levelButtonSelected = get_tree().get_nodes_in_group("LevelButtonGroup")[0]
	levelButtonSelected.grab_focus()
	
	Events.connect("levelSelected", self, "onLevelSelected")


func onLevelSelected(levelButton: LevelButton) -> void:
	levelButtonSelected = levelButton

func _on_PlayButton_pressed():
	LevelManager.currentLevel = levelButtonSelected.levelID
	#LevelManager.nextLevel = levelButtonSelected.nextLevel
	get_tree().change_scene("res://src/GameScene.tscn")
