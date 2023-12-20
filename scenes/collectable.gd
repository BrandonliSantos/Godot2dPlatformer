extends Area2D
@onready var sprite_2d = $AnimatedSprite2D
@onready var game_manager = %GameManager
var collected = false

func _on_body_entered(body):
	if body.name == "CharacterBody2D" and not collected:
		sprite_2d.animation = "collected"
		game_manager.add_point()

func _on_animated_sprite_2d_animation_looped():
	if sprite_2d.animation == "collected":
		queue_free()
