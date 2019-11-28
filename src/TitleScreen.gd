extends Control

onready var optionsPopup := $PopupPanel


func _on_PlayButton_pressed():
	get_tree().change_scene("res://src/LevelSelection.tscn")


func _on_OptionsButton_pressed():
	optionsPopup.popup_centered()


func _on_QuitButton_pressed():
	get_tree().quit()
