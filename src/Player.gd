extends KinematicBody2D

var speed := 64
var targetPosition := Vector2()
var velocity := Vector2()

onready var animationPlayer : AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	targetPosition = position


func _process(delta : float) -> void:
	
	velocity = (targetPosition - position).normalized() * speed
	
	if velocity.length() > 0:
		playAnimation(velocity.normalized())
	else:
		animationPlayer.stop()
	
	if(position.distance_to(targetPosition) < speed * delta):
		position = targetPosition
	else:
		position += velocity * delta 


func _unhandled_input(event : InputEvent) -> void:
	
	var direction : Vector2
	
	if targetPosition != position:
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

