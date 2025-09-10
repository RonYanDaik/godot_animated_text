@tool
extends Node2D


@export var letter : String = "" : set = _set_letter
@export var font : Font : set = _set_font


var size : Vector2


func _ready() -> void:
	pass


func _set_letter(value : String) -> void:
	letter = value
	if has_node("Label"):
		var label := get_node("Label")
		if value.length() > 0:
			label.text = value[0]
		else:
			label.text = ""
		_update_size()


func _set_font(value : Font) -> void:
	font = value
	if has_node("Label"):
		var label : Label= get_node("Label")
		label.add_theme_font_override("font", value)


func _update_size() -> void:
	#var label : Label = get_node("Label")
	if font != null and letter.length() > 0:
		var code := letter.to_utf8_buffer()[0]
		size = font.get_char_size(code,20) #?
		if has_node("Label"):
			var label : Label= get_node("Label")
			label.position = -(size / 2.0)
