extends "res://Assets/Entities/Characters/Templates/BaseCharacter/BaseCharacter.gd"

var scene = preload("res://Assets/Entities/Projectile/Block.tscn")

func _physics_process(delta):
	get_input()
	#velocity.y += gravity * delta
	#velocity = move_and_slide(velocity, Vector2.UP, false, 4, PI/4, false)
	
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
		velocity.y = jumpHeight
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