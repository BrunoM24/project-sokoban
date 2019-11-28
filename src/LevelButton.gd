extends TextureButton
class_name LevelButton

export (PackedScene) var level
export (PackedScene) var nextLevel
export (int) var levelID = 0

func _ready():
	if LevelManager.levels.has(levelID) && LevelManager.levels[levelID]["unlocked"] == true:
		disabled = false
	
	if disabled:
		set_focus_mode(FOCUS_NONE)


func _on_LevelButton_pressed():
	Events.emit_signal("levelSelected", self)
