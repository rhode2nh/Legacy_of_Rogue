extends Node

# This is a singleton script that runs when the game starts. It controls all global actions for the game.
func _ready():
	set_process(true)

func _process(delta):
	if Input.is_action_just_pressed("quit_game"):
		get_tree().quit()