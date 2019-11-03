extends KinematicBody2D
class_name Box

func push(velocity : Vector2) -> void:
	move_and_slide(velocity, Vector2())

func canMove(to : Vector2) -> bool:
	return not test_move(transform, to)