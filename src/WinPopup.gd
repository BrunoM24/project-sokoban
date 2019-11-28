extends PopupMenu


onready var nextLevelButton = $NinePatchRect/MarginContainer/VBoxContainer/HBoxContainer2/NextLevelButton


func _on_ClosesButton_pressed() -> void:
	hide()


func _on_LevelSelectionButton_pressed() -> void:
	get_tree().change_scene("res://src/LevelSelection.tscn")


func _on_BackToMainMenuButton_pressed() -> void:
	get_tree().change_scene("res://src/TitleScreen.tscn")
