extends KinematicBody2D

var speed := 512
var targetPosition := Vector2()

onready var animationPlayer : AnimationHandler = $AnimationPlayer

func _ready() -> void:
	targetPosition = position

func _physics_process(delta : float) -> void:
	var moveTo := Vector2.ZERO
	
	if isMoving():
		moveTo = (targetPosition - position).normalized()
	else:
		position = position.snapped(Vector2(Constants.TILE_SIZE, Constants.TILE_SIZE))
	
	animationPlayer.handleAnimation(moveTo);
	
	move_and_slide(moveTo * speed)
	
	if get_slide_count() > 0:
		checkBoxCollision(moveTo)

func checkBoxCollision(motion : Vector2) -> void:
	var box := get_slide_collision(0).collider as Box
	
	if box:
		if box.canMove(motion):
			box.push(motion * speed)
			return
	
	targetPosition = position.snapped(Vector2(Constants.TILE_SIZE, Constants.TILE_SIZE))

func _unhandled_input(event : InputEvent) -> void:
	#If we are moving, we can't press any key
	if isMoving():
		return
	
	var direction := getDirectionBasedOnInput(event)
	
	#if !test_move(transform, direction * 127):
	targetPosition = position.snapped(Vector2(Constants.TILE_SIZE, Constants.TILE_SIZE)) + direction * Constants.TILE_SIZE

func isMoving() -> bool:
	return position.distance_to(targetPosition) > 4

"""
Using the provided event, check which direction should the player move
"""
func getDirectionBasedOnInput(event : InputEvent) -> Vector2:
	if event.is_action_pressed("ui_up"):
		return Vector2.UP
	elif event.is_action_pressed("ui_right"):
		return Vector2.RIGHT
	elif event.is_action_pressed("ui_down"):
		return Vector2.DOWN
	elif event.is_action_pressed("ui_left"):
		return Vector2.LEFT
	return Vector2.ZERO;