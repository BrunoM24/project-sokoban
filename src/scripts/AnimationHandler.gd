extends AnimationPlayer

class_name AnimationHandler

func handleAnimation(destinationVector: Vector2) -> void:
	if (destinationVector == Vector2.ZERO):
		stop(true)
	else:
		play(DIRECTION_KEYS.get(destinationVector));

"""
Constant to define which vector corresponds to which animation name
"""
const DIRECTION_KEYS = {
	Vector2.UP: "walk_up",
	Vector2.RIGHT: "walk_right",
	Vector2.DOWN: "walk_down",
	Vector2.LEFT: "walk_left",
}