extends Area2D
@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var ray_cast_2d_2: RayCast2D = $RayCast2D2
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var player: CharacterBody2D = $"../Player"



var s=100
var d=1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	animated_sprite_2d.play("enemyani")
	if ray_cast_2d.is_colliding():
		d=-1
		animated_sprite_2d.flip_h = true
	if ray_cast_2d_2.is_colliding():
		d=1
		animated_sprite_2d.flip_h = false
	position.x += delta * d * s


func _on_body_entered(body: Node2D) -> void:
	if body == player:
		player.damage(20)
