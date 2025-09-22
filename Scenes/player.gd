extends CharacterBody2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var attacol: CollisionShape2D = $Area2D/attacol
@onready var attack: Sprite2D = $Area2D/attack
@onready var attanime: AnimationPlayer = $Area2D/attanime
@onready var label1: Label = $Label
@onready var anime: AnimationPlayer = $anime

var SPEED = 300.0
const JUMP_VELOCITY = -700.0
const FALL_VELOCITY = 250
var health : int = 100
var jump = true
var move = true
var dir = "right"
var attcol = false
var last_checkpoint = Vector2()


func _ready() -> void:
	attacol.disabled = true
	attack.visible = false
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
		anime.play("walk")
		attacol.position.x = 148
		attack.flip_h = false
		attack.position.x = 148
		dir = "right"
		sprite_2d.flip_h = false
		
	elif direction < 0:
		attacol.position.x = 78
		attack.flip_h = true
		attack.position.x = 78
		anime.play("walk")
		sprite_2d.flip_h = true
		dir = "left"
	elif direction == 0 and is_on_floor():
		anime.play("idle")
		
		
	if direction and move == true:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)  #player movement
	label1.text = str(health)
	
	
	if not is_on_floor(): #jump animation
		anime.play("jump")
	if Input.is_action_just_pressed("attack"): #attack input
		attanime.play("attack")
		if dir == "left":
			print("left")

		elif dir == "right":
			print("right")

			
			
	move_and_slide()
	if health<=0:
		health = 100
		respawn()
	
	
func respawn():
		global_position=last_checkpoint
