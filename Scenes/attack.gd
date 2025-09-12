extends Area2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var collision_shape_2d_2: CollisionShape2D = $CollisionShape2D2
@onready var anim_1: AnimatedSprite2D = $anim1
@onready var anim_2: AnimatedSprite2D = $anim2
@onready var enemy: Area2D = $enemy

var x = 50

var attcol: = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if attcol == false:
		collision_shape_2d.set_deferred("disabled",true)
		collision_shape_2d_2.set_deferred("disabled",true)
	elif attcol == true:
		collision_shape_2d.set_deferred("disabled",false)
		collision_shape_2d_2.set_deferred("disabled",false)
func _on_body_entered(body: Node2D) -> void: # damage enemy on attack
	
	if body.is_in_group("Body_enemies"):
		
		body.take_damage(x)
		print("damage")
		
		
	
	

	
func animleft():					# attack visibility animation
	anim_2.play("left")
func animright():
	anim_1.play("left")
func visiright(t: bool):
	anim_1.visible = t
func visileft(t: bool):
	anim_2.visible = t


func _on_anim_1_animation_finished() -> void: # visibility toggle right
	visiright(false)
	attacol(false)

func _on_anim_2_animation_finished() -> void: # visibility toggle left
	visileft(false)
	attacol(false)

func attacol(t: bool):
	attcol = t
