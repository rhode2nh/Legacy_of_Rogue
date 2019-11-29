extends "res://Assets/Entities/Characters/Templates/BaseNPC/BaseNPC.gd"

signal hit

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Enemies")


func _physics_process(delta):
	velocity.x = lerp(velocity.x, NO_SPEED, 0.05)


func _on_CollisionHandler_body_entered(body):
	if body.is_in_group("Player"):
		#body.knock_back()
		print("Hit")
