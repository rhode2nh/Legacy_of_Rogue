extends KinematicBody2D

export var moveSpeed = 100
export var gravity = 2000
export var acceleration = 40
export var jumpHeight = -600
export var maxSpeed = 300
export var health = 100
const NO_SPEED = 0

var scene = preload("res://Assets/Entities/Projectile/Block.tscn")

#export (int, 0, 200) var inertia = 100

var velocity = Vector2.ZERO

func get_input():
	# Shoot projectile
	if Input.is_action_just_pressed("ui_page_up"):
		var bullet = scene.instance()
		bullet.global_position = $Bullet_Spawn.global_position
		get_tree().get_root().add_child(bullet)
	# Jump
	if Input.is_action_just_pressed("ui_up"):
		velocity.y = jumpHeight
	# Move right
	if Input.is_action_pressed("ui_right"):
		velocity.x = max(moveSpeed + acceleration, maxSpeed)
		if $Bullet_Spawn.position.x < 0:
			$Bullet_Spawn.position.x = -$Bullet_Spawn.position.x
	# Move left
	elif Input.is_action_pressed("ui_left"):
		velocity.x = min(-moveSpeed - acceleration, -maxSpeed)
		if $Bullet_Spawn.position.x > 0:
			$Bullet_Spawn.position.x = -$Bullet_Spawn.position.x
	else:
		velocity.x = lerp(velocity.x, NO_SPEED, 0.2)

func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP, false, 4, PI/4, false)
	
	# for index in get_slide_count():
	#	var collision = get_slide_collision(index)
	#	if collision.collider.is_in_group("blocks"):
	#		collision.collider.apply_central_impulse(-collision.normal * inertia)


func take_damage(damage):
	health -= damage 
	print("CURRENT HEALTH: ", health)
	if (health <= 0):
		queue_free()


func knock_back():
	velocity.y = jumpHeight