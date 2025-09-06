extends Area2D

@onready var label: Label = $Label
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var player: CharacterBody2D = $"../Player"
@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	if player.health == 100:
		label.text = "health already full"
		label.visible = true
			
	if body == player and player.health != 100:
		if player.health < 50:
			player.health += 50
			
		elif player.health > 50:
			player.health = 100
		queue_free()
		
func _process(delta: float) -> void:
	animated_sprite_2d.play("default")




func _on_body_exited(body: Node2D) -> void:
	timer.start()
	
func _on_timer_timeout() -> void:
	label.visible = false
