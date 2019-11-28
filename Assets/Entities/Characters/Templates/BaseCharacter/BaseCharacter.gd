extends KinematicBody2D

# warning-ignore:unused_class_variable
export var moveSpeed = 100
export var gravity = 2000
# warning-ignore:unused_class_variable
export var acceleration = 40
# warning-ignore:unused_class_variable
export var jumpHeight = -600
# warning-ignore:unused_class_variable
export var maxSpeed = 300
# warning-ignore:unused_class_variable
export var health = 100
const NO_SPEED = 0
export var debugMode = false

var velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP, false, 4, PI/4, false)


func take_damage(damage):
	health -= damage 
	if debugMode:
		print(self.name, " Health: ", health)
	if (health <= 0):
		queue_free()


func knock_back(var xKnockBack):
	velocity.y = jumpHeight
	velocity.x = xKnockBack