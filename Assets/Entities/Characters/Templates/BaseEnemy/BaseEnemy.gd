extends "res://Assets/Entities/Characters/Templates/BaseNPC/BaseNPC.gd"

signal hit

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_CollisionHandler_body_entered(body):
	if body.is_in_group("Player"):
		body.knock_back()
		print("Hit")
		
