extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -900.0
@onready var sprite_2d = $Sprite2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	move_anim_handler()
	jump_anim_handler()

	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	sprite_flip_handler()

func sprite_flip_handler():
	if velocity.x != 0:
		var isLeft = velocity.x < 0
		sprite_2d.flip_h = isLeft

func move_anim_handler():
	if velocity.x > 1 or velocity.x < -1:
		sprite_2d.animation = "running"
	else:
		sprite_2d.animation = "default"

func jump_anim_handler():
	if velocity.y != 0:
		sprite_2d.animation = "falling" if velocity.y > 0 else "jumping"
