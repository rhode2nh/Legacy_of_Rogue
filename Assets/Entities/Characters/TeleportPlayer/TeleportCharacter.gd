extends "res://Assets/Entities/Characters/Templates/BasePlayer/BasePlayer.gd"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_left"):
		if $Blink.position.x > 0:
			$Blink.position = -$Blink.position
	if Input.is_action_just_pressed("ui_right"):
		if $Blink.position.x < 0:
			$Blink.position = -$Blink.position
	if Input.is_action_just_pressed("power_up"):
		global_position = $Blink.global_position