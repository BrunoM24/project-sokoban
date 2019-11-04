extends KinematicBody2D

var speed := 128
var targetPosition := Vector2()
var velocity := Vector2()

onready var animationPlayer : AnimationHandler = $AnimationPlayer

func _ready() -> void:
	targetPosition = position

func _physics_process(delta : float) -> void:
	var moveTo := Vector2()
	
	if position.distance_to(targetPosition) > 1:
		moveTo = (targetPosition - position).normalized()
	else:
		position = position.snapped(Vector2(128, 128))
	
	animationPlayer.handleAnimation(moveTo);
	
	move_and_slide(moveTo * speed)
	
	if get_slide_count() > 0:
		checkBoxCollision(moveTo)


func _unhandled_input(event : InputEvent) -> void:
	var direction : Vector2
	
	if position.distance_to(targetPosition) > 1:
		return
	
	if event.is_action_pressed("ui_up"):
		direction = Vector2.UP
	elif event.is_action_pressed("ui_right"):
		direction = Vector2.RIGHT
	elif event.is_action_pressed("ui_down"):
		direction = Vector2.DOWN
	elif event.is_action_pressed("ui_left"):
		direction = Vector2.LEFT
	else:
		direction = Vector2.ZERO
	
	#if !test_move(transform, direction * 127):
	targetPosition = position.snapped(Vector2(128, 128)) + direction * speed

func checkBoxCollision(motion : Vector2) -> void:
	var box := get_slide_collision(0).collider as Box
	
	if box:
		if box.canMove(motion):
			box.push(motion * speed)
			return
	
	targetPosition = position.snapped(Vector2(128, 128))

