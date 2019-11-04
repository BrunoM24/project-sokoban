extends AnimationPlayer

class_name AnimationHandler

var lastDirection := Vector2.DOWN

func handleAnimation(destinationVector: Vector2) -> void:
	var dictionary := IDLE_DIRECTION_KEYS
	if (destinationVector != Vector2.ZERO):
		#If we are not idle, we need to know where we are going
		lastDirection = destinationVector
		dictionary = WALK_DIRECTION_KEYS
	play(dictionary.get(lastDirection));

"""
Constant to define which vector corresponds to which idle_animation name
"""
const IDLE_DIRECTION_KEYS = {
	Vector2.UP: "idle_up",
	Vector2.RIGHT: "idle_right",
	Vector2.DOWN: "idle_down",
	Vector2.LEFT: "idle_left",
}

"""
Constant to define which vector corresponds to which walk_animation name
"""
const WALK_DIRECTION_KEYS = {
	Vector2.UP: "walk_up",
	Vector2.RIGHT: "walk_right",
	Vector2.DOWN: "walk_down",
	Vector2.LEFT: "walk_left",
}