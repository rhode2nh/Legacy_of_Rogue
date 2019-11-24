"""This contains all of the attributes that enemies will inherit."""

extends "res://Assets/Entities/Characters/BaseNPC/BaseNPC.gd"

#TODO: Create damage variable for the projectile object.
#TODO: What should all enemies inherit?

signal collision 

func _process(delta):
	if health <= 0:
		queue_free()

# Handle_Collision: Fired when enemy collides with player 
# Possible different results from collision based on enemy's own type
# eg: 
# Enemy has spiky body -- player is damaged
# Enemy is soft and squishy and player lands on top -- enemy is damaged 
# Enemy is psychic and teleports on contact 
func _Handle_Collision():
	pass # Replace with function body.
