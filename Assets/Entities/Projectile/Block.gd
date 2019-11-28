extends Area2D

onready var spawn = get_node("/root/Main/BasePlayer/BulletSpawn")
var spawnNegative = false
export var bulletSpeed = 15
export var damage = 15


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
		body.take_damage(damage)
		body.knock_back()
	queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	print('deleted')


#func _on_Block_area_entered(area):
#	if area.is_in_group("Enemies"):
#		area.health -= damage
#		print("Health remaining: ", area.health)
#		queue_free()
		
