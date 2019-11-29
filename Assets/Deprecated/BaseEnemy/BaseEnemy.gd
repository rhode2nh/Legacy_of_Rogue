"""This contains all of the attributes that enemies will inherit."""

extends "res://Assets/Entities/Characters/BaseNPC/BaseNPC.gd"

#TODO: Create damage variable for the projectile object.
#TODO: What should all enemies inherit?
export var damage = 10
var detected = false

func _process(delta):
	if detected:
		position.x -= 1
	if health <= 0:
		queue_free()
	

# Handle_Collision: Fired when enemy collides with player 
# Possible different results from collision based on enemy's own type
# eg: 
# Enemy has spiky body -- player is damaged
# Enemy is soft and squishy and player lands on top -- enemy is damaged 
# Enemy is psychic and teleports on contact 
func Handle_Player_Collision(var player):
	pass


# This prototype is a spikyboi 
# Hurts player
func _on_BaseEnemy_body_entered(body):
	if body.is_in_group("Player"):
		body.take_damage(self.damage)
		body.knock_back()


func _on_Detection_body_entered(body):
	if body.is_in_group("Player"):
		detected = true


func _on_Detection_body_exited(body):
	if body.is_in_group("Player"):
		detected = false
