extends TextureButton
class_name LevelButton

export (PackedScene) var level

func _ready():
	if disabled:
		set_focus_mode(FOCUS_NONE)


func _on_LevelButton_pressed():
	Events.emit_signal("levelSelected", self)
