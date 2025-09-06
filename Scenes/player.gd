extends CharacterBody2D

@onready var label1: Label = $Label
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var SPEED = 300.0
const JUMP_VELOCITY = -700.0
const FALL_VELOCITY = 250
var health : int = 100

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	elif Input.is_action_just_released("jump"):
		velocity.y = FALL_VELOCITY

	var direction := Input.get_axis("left", "right")
	
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
	elif direction == 0 and is_on_floor():
		animated_sprite_2d.play("idle")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	label1.text = str(health)
	if not is_on_floor():
		animated_sprite_2d.play("jump")
	move_and_slide()
	respawn()
func damage(x):
	health-=x
	
func respawn():
	if health <= 0:
		get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
