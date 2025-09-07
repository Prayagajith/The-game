extends Area2D
@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var ray_cast_2d_2: RayCast2D = $RayCast2D2
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var player: CharacterBody2D = $"../Player"
@onready var timer: Timer = $Timer
@onready var leftcol: CollisionShape2D = $Area2D2/leftcol
@onready var topcol: CollisionShape2D = $Area2D3/topcol
@onready var rightcol: CollisionShape2D = $Area2D/rightcol
@onready var timer_2: Timer = $Timer2

var dam = true

var s=100
var d=1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	ray_cast_2d.add_exception(player)
	ray_cast_2d_2.add_exception(player)
	animated_sprite_2d.play("enemyani")
	if ray_cast_2d.is_colliding():
		d=-1
		animated_sprite_2d.flip_h = true
	if ray_cast_2d_2.is_colliding():
		d=1
		animated_sprite_2d.flip_h = false
	position.x += delta * d * s


func _on_body_entered(body: Node2D) -> void:
	if body == player and dam == true:
		player.damage(20)
		

func _on_area_2d_2_body_entered(body: Node2D) -> void:
	timer.start()
	timer_2.start()
	if player.velocity.x == 0 and player.velocity.y == 0:
		player.velocity.x = -1 * 50
	else:
		player.velocity.x = -1 * 200
	player.animated_sprite_2d.play("damage")
	player.velocity.y = -300
	player.SPEED *= -1
	leftcol.set_deferred("disabled", true)
	rightcol.set_deferred("disabled", true)
	topcol.set_deferred("disabled", true)
	dam = true
func _on_area_2d_3_body_entered(body: Node2D) -> void:
	timer.start()
	timer_2.start()
	player.SPEED *= -1
	leftcol.set_deferred("disabled", true)
	rightcol.set_deferred("disabled", true)
	topcol.set_deferred("disabled", true)

func _on_area_2d_body_entered(body: Node2D) -> void:
	timer.start()
	timer_2.start()
	if player.velocity.x == 0 and player.velocity.y == 0:
		player.velocity.x = 1 * 50
	elif player.velocity.x > 0 or player.velocity.x < 0:
		player.velocity.x = 1 * 200
	player.animated_sprite_2d.play("damage")
	player.velocity.y = -300
	player.SPEED *= -1
	leftcol.set_deferred("disabled", true)
	rightcol.set_deferred("disabled", true)
	topcol.set_deferred("disabled", true)
	dam = true

func _on_timer_timeout() -> void:
	player.SPEED=300
	dam = false

func _on_timer_2_timeout() -> void:
	leftcol.set_deferred("disabled", false)
	rightcol.set_deferred("disabled", false)
	topcol.set_deferred("disabled", false)
	dam = false
