"""This contains all of the attributes that enemies will inherit."""

extends "res://Assets/Entities/Characters/*BaseNPC/BaseNPC.gd"

#TODO: Create damage variable for the projectile object.
#TODO: What should all enemies inherit?
func _on_BaseEnemy_area_entered(area):
	if area.is_in_group("Projectiles"):
		health -= 10
		print('Health remaining: ', health)
		area.queue_free()
	if health <= 0:
		queue_free()