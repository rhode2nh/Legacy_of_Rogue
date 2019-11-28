extends KinematicBody2D

export var moveSpeed = 100
export var gravity = 2000
export var acceleration = 40
export var jumpHeight = -600
export var maxSpeed = 300
export var health = 100
const NO_SPEED = 0

var velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP, false, 4, PI/4, false)

