extends Area2D

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var collision_shape_2d_2: CollisionShape2D = $CollisionShape2D2
@onready var anim_1: AnimatedSprite2D = $anim1
@onready var anim_2: AnimatedSprite2D = $anim2

@export var test: int = 100


signal enemyd()

var attcol = false

func _process(delta: float) -> void:
	collision_shape_2d.disabled = not attcol
	collision_shape_2d_2.disabled = not attcol

func animleft():
	anim_2.play("left")

func animright():
	anim_1.play("left")

func visiright(t: bool):
	anim_1.visible = t

func visileft(t: bool):	
	anim_2.visible = t

func _on_anim_1_animation_finished() -> void:
	visiright(false)
	attacol(false)

func _on_anim_2_animation_finished() -> void:
	visileft(false)
	attacol(false)

func attacol(t: bool):
	attcol = t

func _on_body_entered(body: Node2D) -> void:
		print("Hit enemy:", body.name)
		emit_signal("enemyd", body)  # pass the enemy node that was hit
		if body.is_in_group("enemy"):
			body.enehealth -= 100
