extends KinematicBody2D
class_name Box

onready var tween : Tween = $Tween

export var slidingTime := 1

var tilemap : TileMap
var sliding := false

func _ready():
	position = calculateDestination(Vector2())


func initialized(_tilemap : TileMap) -> void:
	tilemap = _tilemap
	position = calculateDestination(Vector2())


func calculateDestination(direction : Vector2) -> Vector2:
	var t = position.snapped(Vector2(128, 128)) + direction * 128
	return t


func push(velocity : Vector2) -> void:
	if sliding:
		return
	
	var moveTo := calculateDestination(velocity.normalized())
	
	print(moveTo)
	if tMove(moveTo):
		print("canMove started")
		tween.interpolate_property(self, "global_position", global_position, moveTo, slidingTime, Tween.TRANS_CUBIC, Tween.EASE_OUT)
		tween.start()
		sliding = true
		yield(tween, "tween_completed")
		sliding = false
	
	#move_and_slide(velocity, Vector2())


func canMove(to : Vector2) -> bool:
	return not test_move(transform, to)


func tMove(to : Vector2) -> bool:
	var t := Transform2D(transform)
	t.origin = to
	return not test_move(t, Vector2())
