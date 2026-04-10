extends Node2D

const GRID_RADIUS: int = 8

func _ready() -> void:
	_generate_ground()

func _generate_ground() -> void:
	var half_w: float = Global.TILE_WIDTH * 0.5
	var half_h: float = Global.TILE_HEIGHT * 0.5
	var diamond := PackedVector2Array([
		Vector2(0.0,    -half_h),
		Vector2(half_w,  0.0),
		Vector2(0.0,     half_h),
		Vector2(-half_w, 0.0),
	])

	for ix in range(-GRID_RADIUS, GRID_RADIUS + 1):
		for iy in range(-GRID_RADIUS, GRID_RADIUS + 1):
			var tile := Polygon2D.new()
			tile.polygon = diamond
			# Checkerboard shading for grid readability
			var even: bool = (ix + iy) % 2 == 0
			tile.color = Color(0.15, 0.28, 0.15) if even else Color(0.11, 0.20, 0.11)
			tile.position = Vector2(
				(ix - iy) * half_w,
				(ix + iy) * half_h
			)
			add_child(tile)
