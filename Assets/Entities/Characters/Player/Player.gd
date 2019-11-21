extends KinematicBody2D

const MOVE_SPEED = 100
const GRAVITY = 2000
const ACCELERATION = 40
const JUMP_HEIGHT = -600
const MAX_SPEED = 300
const NO_SPEED = 0

var scene = preload("res://Assets/Entities/Projectile/Block.tscn")

export (int, 0, 200) var inertia = 100

var velocity = Vector2.ZERO

func get_input():
	if Input.is_action_pressed("ui_right"):
		velocity.x = max(MOVE_SPEED + ACCELERATION, MAX_SPEED)
		if $Bullet_Spawn.position.x < 0:
			$Bullet_Spawn.position.x = -$Bullet_Spawn.position.x
	elif Input.is_action_pressed("ui_left"):
		velocity.x = min(-MOVE_SPEED - ACCELERATION, -MAX_SPEED)
		if $Bullet_Spawn.position.x > 0:
			$Bullet_Spawn.position.x = -$Bullet_Spawn.position.x
	if Input.is_action_just_pressed("ui_up"):
		velocity.y = JUMP_HEIGHT
	else:
		velocity.x = lerp(velocity.x, NO_SPEED, 0.2)

func _physics_process(delta):
	get_input()
	velocity.y += GRAVITY * delta
	velocity = move_and_slide(velocity, Vector2.UP, false, 4, PI/4, false)
	
	for index in get_slide_count():
		var collision = get_slide_collision(index)
		if collision.collider.is_in_group("blocks"):
			collision.collider.apply_central_impulse(-collision.normal * inertia)
			
func _process(delta):
	if Input.is_action_just_pressed("ui_page_up"):
		var bullet = scene.instance()
		bullet.global_position = $Bullet_Spawn.global_position
		get_tree().get_root().add_child(bullet)