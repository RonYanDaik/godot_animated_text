@tool
extends Sprite2D
class_name AnimTextSprite

var start_global_position : Vector2

func _ready() -> void:
	start_global_position = global_position
	pass
