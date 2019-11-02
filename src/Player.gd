extends KinematicBody2D

var speed := 128
var targetPosition := Vector2()
var velocity := Vector2()

onready var animationPlayer : AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	targetPosition = position


func _physics_process(delta : float) -> void:
	#var t : = Vector2()
	
	#velocity = (targetPosition - position).normalized() * speed
	
	#if velocity.length() > 0:
	#	playAnimation(velocity.normalized())
	#else:
	#	animationPlayer.stop()
	
	#if(position.distance_to(targetPosition) < speed * delta):
	#	position = targetPosition
	#else:
	#	position += velocity * delta 
	
	#print(targetPosition)
	
	#move_and_slide(targetPosition.normalized() * speed, Vector2())
	
	#var motion : = Vector2()
	#motion.x = int(Input.get_action_strength("ui_right")) - int(Input.get_action_strength("ui_left"))
	#motion.y = int(Input.get_action_strength("ui_down")) - int(Input.get_action_strength("ui_up"))
	
	#print((targetPosition - position).normalized())
	
	var moveTo := Vector2()
	
	if(position.distance_to(targetPosition) > 0.5):
		moveTo = (targetPosition - position).normalized()
	
	if(moveTo != Vector2.ZERO):
		playAnimation(moveTo)
	else:
		animationPlayer.stop()
	
	move_and_slide(moveTo * speed)


func _unhandled_input(event : InputEvent) -> void:
	
	var direction : Vector2
	
	if position.distance_to(targetPosition) > 4:
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
	
	if !test_move(transform, direction * 64):
		targetPosition = position + direction * speed


func playAnimation(direction : Vector2) -> void:
	var animation : String
	
	match direction:
		Vector2.UP:
			animation = "walk_up"
		Vector2.RIGHT:
			animation = "walk_right"
		Vector2.DOWN:
			animation = "walk_down"
		Vector2.LEFT:
			animation = "walk_left"
	
	animationPlayer.play(animation)

