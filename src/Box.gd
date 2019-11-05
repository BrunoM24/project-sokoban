extends KinematicBody2D
class_name Box

onready var tween : Tween = $Tween

export var slidingTime := 1

var tilemap : TileMap
var sliding := false

func _ready():
	position = calculateDestination(Vector2())

"""
	Not being used, to use in the futere if needed
	to be caled from the tilemap
"""
func initialized(_tilemap : TileMap) -> void:
	tilemap = _tilemap
	position = calculateDestination(Vector2())


func calculateDestination(direction : Vector2) -> Vector2:
	return position.snapped(Vector2(Constants.TILE_SIZE, Constants.TILE_SIZE)) + direction * Constants.TILE_SIZE


func push(velocity : Vector2) -> void:
	if sliding:
		return
	
	var moveTo := calculateDestination(velocity.normalized())
	
	if tMove(moveTo):
		tween.interpolate_property(self, "global_position", global_position, moveTo, slidingTime, Tween.TRANS_CUBIC, Tween.EASE_OUT)
		tween.start()
		sliding = true
		yield(tween, "tween_completed")
		sliding = false


func canMove(to : Vector2) -> bool:
	return not test_move(transform, to)


func tMove(to : Vector2) -> bool:
	var newTransform := Transform2D(transform)
	newTransform.origin = to
	return not test_move(newTransform, Vector2())
