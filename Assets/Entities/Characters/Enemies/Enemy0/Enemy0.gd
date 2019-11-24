extends "res://Assets/Entities/Characters/*BaseEnemy/BaseEnemy.gd"

func _physics_process(delta):
	if $RayCast2D.is_colliding():
		if $RayCast2D.get_collider().is_in_group("Player"):
			print("test")
