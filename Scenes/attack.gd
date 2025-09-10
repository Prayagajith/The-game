extends Area2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var player: CharacterBody2D = $".."
@onready var anim_1: AnimatedSprite2D = $anim1
@onready var anim_2: AnimatedSprite2D = $anim2
@onready var enemy: Area2D = $"."


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body == Area2D:
		enemy.enemyhealth-=100
	
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


func _on_anim_2_animation_finished() -> void:
	visileft(false)
