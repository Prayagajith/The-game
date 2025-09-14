extends Area2D

@onready var label: Label = $Label
@onready var anime: AnimatedSprite2D = $AnimatedSprite2D
@onready var player: CharacterBody2D = $"../Player"
@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:	#dont pickup health if health already full
	if player.health == 100:
		label.text = "health already full"
		label.visible = true
			
	if body == player and player.health != 100:		# heal if pickup
		if player.health < 50:
			player.health += 50
			
		elif player.health > 50:
			player.health = 100
		queue_free()
		
func _process(delta: float) -> void: # health pickup animation
	anime.play("default")




func _on_body_exited(body: Node2D) -> void:
	timer.start()
	
func _on_timer_timeout() -> void:
	label.visible = false
