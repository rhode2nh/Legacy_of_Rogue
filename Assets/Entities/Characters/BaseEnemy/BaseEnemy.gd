"""This contains all of the attributes that enemies will inherit."""

extends "res://Assets/Entities/Characters/BaseNPC/BaseNPC.gd"

#TODO: Create damage variable for the projectile object.
#TODO: What should all enemies inherit?
func _process(delta):
	if health <= 0:
		queue_free()