extends CharacterBody2D
@onready var kill_zone: Area2D = $"Kill zone"


@onready var label1: Label = $Label
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var SPEED = 300.0
const JUMP_VELOCITY = -700.0
const FALL_VELOCITY = 250
var health : int = 100
var jump = true
var move = true
var dir = "right"

var attcol = false
var last_checkpoint = Vector2()
@onready var attack: Area2D = $attack



func _physics_process(delta: float) -> void:

	if not is_on_floor():						# gravity
		velocity += get_gravity() * delta
		
	
	if Input.is_action_just_pressed("jump") and is_on_floor(): # Handle jump
		velocity.y = JUMP_VELOCITY
		Input.start_joy_vibration(0, 1, 0, 0.1)
	elif Input.is_action_just_released("jump") and jump == true:
		velocity.y = FALL_VELOCITY
		jump = false
	if is_on_floor():   	#jump switch
		jump = true
	
		
	var direction := Input.get_axis("left", "right") #getting input
	
	
	if direction > 0:							#player animation
		animated_sprite_2d.play("run")
		animated_sprite_2d.flip_h = false
		dir = "right"
	elif direction < 0:
		animated_sprite_2d.play("run")
		animated_sprite_2d.flip_h = true
		dir = "left"
	elif direction == 0 and is_on_floor():
		animated_sprite_2d.play("idle")
		
		
	if direction and move == true:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)  #player movement
	label1.text = str(health)
	
	
	if not is_on_floor(): #jump animation
		animated_sprite_2d.play("jump")
	if Input.is_action_just_pressed("attack"): #attack input
		attack.attacol(true)
		if dir == "left":
			attack.visileft(true)            
			attack.animleft()
		elif dir == "right":
			attack.visiright(true)

			attack.animright()			
			attack.animright()
			
			
	move_and_slide()
	if health<=0:
		respawn()
	
	
func respawn():
		print("workink")
		health = 100
		global_position=last_checkpoint
