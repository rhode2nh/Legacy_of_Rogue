extends Area2D

onready var spawn = get_node("/root/Main/BasePlayer/BulletSpawn")
var spawnNegative = false
export var bulletSpeed = 15
export var damage = 15
export var xKnockBack = 400
export var yKnockBack = -400


func _ready():
	add_to_group("Projectiles")
	if spawn.position.x < 0:
		spawnNegative = true
		$RayCast2D.set_cast_to(-$RayCast2D.get_cast_to())


func _process(delta):
	if spawnNegative:
		position.x -= bulletSpeed
	else:
		position.x += bulletSpeed


func _on_Block_body_entered(body):
	if body.is_in_group("Enemies"):
		# Check which direction to knockback the character
		if $RayCast2D.get_cast_to().x > 0:
			body.knock_back(xKnockBack, yKnockBack)
		else:
			body.knock_back(-xKnockBack, yKnockBack)
		body.take_damage(damage)
		body.take_damage_color()
	queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	#print('deleted')