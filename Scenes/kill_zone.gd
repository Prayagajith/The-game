extends Node2D

@onready var player: CharacterBody2D = $"../Player"

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:				#redirect to main menu after falling off the map
	player.respawn()
