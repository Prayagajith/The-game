extends Area2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
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
	
