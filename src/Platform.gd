extends Area2D

signal gameWon


func _on_Platform_body_entered(body):
	emit_signal("gameWon")
