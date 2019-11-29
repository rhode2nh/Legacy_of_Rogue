extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	for player in get_tree().get_nodes_in_group("Player"):
		player.global_position = get_node("Scene1/PlayerSpawn").global_position


func _process(delta):
	for player in get_tree().get_nodes_in_group("Player"):
		if player.global_position.y > 1000:
			player.global_position = get_node("Scene1/PlayerSpawn").global_position
