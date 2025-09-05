extends CharacterBody2D
@onready var label1: Label = $Label



const SPEED = 300.0
const JUMP_VELOCITY = -500.0
const FALL_VELOCITY = 300
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var health = 100
func _physics_process(delta: float) -> void:
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		animated_sprite_2d.play("jump")
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	elif Input.is_action_just_released("jump"):
		velocity.y = FALL_VELOCITY
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
	elif direction == 0 and is_on_floor():
		animated_sprite_2d.play("idle")
	if direction:
		velocity.x = direction * SPEED
		d
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	label1.text = str(health)
	move_and_slide()

	
