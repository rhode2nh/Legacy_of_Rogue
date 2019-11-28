extends Area2D

onready var spawn = get_node("/root/Main/BasePlayer/BulletSpawn")
var spawnNegative = false
export var bulletSpeed = 15
export var damage = 15
export var xKnockBack = 100


func _ready():
	add_to_group("Projectiles")
	if spawn.position.x < 0:
		spawnNegative = true


func _process(delta):
	if spawnNegative:
		position.x -= bulletSpeed
	else:
		position.x += bulletSpeed


func _on_Block_body_entered(body):
	if body.is_in_group("Enemies"):
		if position.x - body.position.x < 0:
			body.knock_back(xKnockBack)
		else:
			body.knock_back(-xKnockBack)
		print(position - body.position)
		body.take_damage(damage)
	queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	print('deleted')