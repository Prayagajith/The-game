extends CharacterBody2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

enum states {IDLE , RUN , JUMP , ATTACK , DAMAGE , FALL , DOUBLE_JUMP , DEATH}
var current_state = states.IDLE

func _physics_process(delta: float) -> void:
	pass

func idle_state(delta):
	velocity.x = move_toward(velocity.x, 0, SPEED)
	animation_player.play("idle")
	

	if Input.get_axis("left","right") != 0:
		current_state = states.RUN
	elif Input.is_action_just_pressed("attack"):
		current_state = states.ATTACK
	elif is_on_floor() and Input.is_action_just_pressed("jump"):
		jump_action()
	elif not is_on_floor():
		current_state = states.JUMP
		
func jump_action():
	pass
	
