extends Area2D
@onready var game_manager = get_node("/root/GameManager")

func _on_body_entered(body):
	game_manager.change_level()
