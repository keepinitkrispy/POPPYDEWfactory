extends CharacterBody2D

const SPEED: float = 150.0

func _physics_process(_delta: float) -> void:
	var input := Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")
	)

	if input == Vector2.ZERO:
		velocity = Vector2.ZERO
		move_and_slide()
		return

	# Project flat 2D input into isometric screen-space movement.
	# Preserves the mandatory 2:1 tile aspect ratio from Global.
	velocity = Vector2(
		(input.x - input.y) * (Global.TILE_WIDTH * 0.5),
		(input.x + input.y) * (Global.TILE_HEIGHT * 0.5)
	).normalized() * SPEED

	move_and_slide()

	# Keep draw order correct as the character moves north/south.
	z_index = int(position.y / Global.TILE_HEIGHT)
