extends Control
@onready var play: Button = $Button
@onready var exit: Button = $Button2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play.grab_focus()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _input(event):
	if event.is_action_pressed("jump"):
		var focused
		if play.has_focus():
			focused = play
		elif exit.has_focus():
			focused = exit
		if focused and focused is Button:
			focused.emit_signal("pressed")
	if event.is_action_pressed("down"):
		exit.grab_focus()
	elif event.is_action_pressed("up"):
		play.grab_focus()
func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/world.tscn")


func _on_button_2_pressed() -> void:
	get_tree().quit()
