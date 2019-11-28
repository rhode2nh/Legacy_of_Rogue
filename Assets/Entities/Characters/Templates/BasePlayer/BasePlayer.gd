extends "res://Assets/Entities/Characters/Templates/BaseCharacter/BaseCharacter.gd"

var scene = preload("res://Assets/Entities/Projectile/Block.tscn")

func _physics_process(delta):
	jump_check()
	get_input()
	
	# for index in get_slide_count():
	#	var collision = get_slide_collision(index)
	#	if collision.collider.is_in_group("blocks"):
	#		collision.collider.apply_central_impulse(-collision.normal * inertia)


func get_input():
	# Shoot projectile
	if Input.is_action_just_pressed("ui_page_up"):
		var bullet = scene.instance()
		bullet.global_position = $BulletSpawn.global_position
		get_tree().get_root().add_child(bullet)
	# Jump
	if Input.is_action_just_pressed("ui_up"):
		if jumps > 0:
			velocity.y = jumpHeight
			jumps -= 1
	# Move right
	if Input.is_action_pressed("ui_right"):
		velocity.x = max(moveSpeed + acceleration, maxSpeed)
		if $BulletSpawn.position.x < 0:
			$BulletSpawn.position.x = -$BulletSpawn.position.x
	# Move left
	elif Input.is_action_pressed("ui_left"):
		velocity.x = min(-moveSpeed - acceleration, -maxSpeed)
		if $BulletSpawn.position.x > 0:
			$BulletSpawn.position.x = -$BulletSpawn.position.x
	else:
		velocity.x = lerp(velocity.x, NO_SPEED, 0.2)