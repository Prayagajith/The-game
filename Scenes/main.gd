extends Node

func _ready() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn") # redirect to main menu


func _process(delta: float) -> void:
	pass
