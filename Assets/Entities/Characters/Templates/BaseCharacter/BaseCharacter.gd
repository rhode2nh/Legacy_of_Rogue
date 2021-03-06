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
export var jumps = 1
export var maxJumps = 3
const NO_SPEED = 0
export var debugMode = false
var hit = false
var damage = 1
var critChance = 0.0

var velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	$Health.set_text("Health: " + str(health))
	pass # Replace with function body.


func _physics_process(delta):
	if hit:
		velocity = Vector2(0, 0)
	else:
		velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP, false, 4, PI/4, false)



func take_damage(damage):
	health -= damage 
	$Health.set_text("Health: " + str(health))
	if debugMode:
		print(self.name, " Health: ", health)
	if (health <= 0):
		queue_free()


func knock_back(var xKnockBack, var yKnockBack):
	hit = true
	var t = Timer.new()
	t.set_wait_time(0.2)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	velocity.x = xKnockBack
	velocity.y = yKnockBack
	hit = false
	t.queue_free()


func jump_check():
	if is_on_floor():
		jumps = maxJumps


func take_damage_color():
	var t = Timer.new()
	t.set_wait_time(0.1)
	t.set_one_shot(true)
	self.add_child(t)
	$Sprite.set_modulate(Color.red)
	t.start()
	yield(t, "timeout")
	$Sprite.set_modulate(Color.white)
	t.queue_free()