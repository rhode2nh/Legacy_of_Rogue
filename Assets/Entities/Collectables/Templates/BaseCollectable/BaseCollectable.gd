extends Area2D

signal collected

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_BaseCollectable_body_entered(body):
	if body.is_in_group("Player"):
		emit_signal("collected")
		queue_free()
