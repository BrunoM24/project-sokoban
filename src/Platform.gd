extends Area2D

"""
	The Plataform will emit a boxPlaced signal each time a box is placed inside the plataform
"""


func _on_Platform_body_entered(body):
	print("Emit signal boxPlaced")
	Events.emit_signal("boxPlaced")
