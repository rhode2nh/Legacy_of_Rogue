extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	$BasePlayer.global_position = get_node("Scene1/PlayerSpawn").global_position


func _process(delta):
	if $BasePlayer.global_position.y > 1000:
		$BasePlayer.global_position = get_node("Scene1/PlayerSpawn").global_position
