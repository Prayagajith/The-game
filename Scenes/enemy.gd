extends Area2D
@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var ray_cast_2d_2: RayCast2D = $RayCast2D2
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var player: CharacterBody2D = $"../Player"
@onready var timer: Timer = $Timer
@onready var timer_2: Timer = $Timer2
@onready var leftcol: CollisionShape2D = $Area2D2/leftcol
@onready var rightcol: CollisionShape2D = $Area2D/rightcol
@onready var attack: Area2D = $"."




var enehealth := 100

var leftk
var rightk
var dam = true
var enemyhealth := 100
var s=100
var d=1
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	attack.connect("enemydamage",Callable(self,"_on_enemydamage"))

func _process(delta: float) -> void:	#enemy movement
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
	leftk = Vector2(-1900, -200)
	rightk = Vector2(1900, -200)
	if enemyhealth <= 0: 	# enemy death
		queue_free()

func _on_body_entered(body: Node2D) -> void: 	# player damage by enemy
	pass
		
	
func _on_area_2d_2_body_entered(body: Node2D) -> void:	 # player knockback on damage (kinda works)
	timer.start()
	timer_2.start()
	if player.velocity == Vector2(0,0): 
		player.velocity = leftk
	elif player.velocity > Vector2(0,0) or player.velocity < Vector2(0,0):
		player.velocity = leftk
	if body == player and dam:
		player.health-=20
		player.animated_sprite_2d.play("damage")
	player.animated_sprite_2d.play("damage")
	leftcol.set_deferred("disabled", true)
	rightcol.set_deferred("disabled", true)
	player.move = false
	dam = false


func _on_area_2d_body_entered(body: Node2D) -> void:	 # player knockback on damage (kinda works)
	timer.start()
	timer_2.start()
	if player.velocity == Vector2(0,0):
		player.velocity = rightk
	elif player.velocity > Vector2(0,0) or player.velocity < Vector2(0,0):
		player.velocity = rightk
	if body == player and dam:
		player.health-=20
		player.animated_sprite_2d.play("damage")
	player.animated_sprite_2d.play("damage") # player damage animation (WIP)
	leftcol.set_deferred("disabled", true)
	rightcol.set_deferred("disabled", true)
	player.move = false
	dam = false

func _on_timer_timeout() -> void:
	player.move = true
func _on_timer_2_timeout() -> void:
	dam = true
	leftcol.set_deferred("disabled", false)
	rightcol.set_deferred("disabled", false)

func _on_enemydamage():		# enemy damage on attack (WIP)
	enemyhealth-=100
	print("damage")

func _on_attack_body_entered(body: Node2D) -> void:
		enemyhealth-=100
		print("tftyf")


func _on_body_exited(body: Node2D) -> void:
	pass
func take_damage(x):
	enehealth -= x
	print ("damage dealt")
	if enehealth <= 0:
		queue_free()
