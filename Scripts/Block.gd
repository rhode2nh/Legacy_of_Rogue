extends Area2D

onready var spawn = get_node("/root/Main/Player/Bullet_Spawn")
var spawnNegative = false
export var bulletSpeed = 100


func _ready():
	if spawn.position.x < 0:
		spawnNegative = true


func _process(delta):
	if spawnNegative:
		position.x -= bulletSpeed
	else:
		position.x += bulletSpeed


func _on_Block_body_entered(body):
	queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	print('deleted')
