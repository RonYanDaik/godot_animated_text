@tool
extends Node2D


@export var regen : bool : set = _set_regen
@export var text : String : set = _set_text
@export var character_container : NodePath
@export var font : Font : set = _set_font


var _character_container : Node2D
var _letter_prefab : PackedScene = preload("animated_text_letter.tscn")


func _ready() -> void:
	if has_node(character_container):
		_character_container = get_node(character_container)


func _set_regen(value : bool) -> void:
	if value:
		_regen_characters()


func _set_text(value : String) -> void:
	text = value
	_regen_characters()


func _set_font(value : Font) -> void:
	font = value
	_regen_characters()


func _regen_characters() -> void:
	var cont := _character_container
	if Engine.is_editor_hint():
		cont = get_node(character_container)
	if cont and _letter_prefab:
		for c in cont.get_children():
			c.queue_free()
		var x : float = 0.0
		for index in text.length():
			var l := text[index]
			var letter : Node2D = _letter_prefab.instantiate()
			cont.add_child(letter)
			if Engine.is_editor_hint():
				letter.owner = get_tree().edited_scene_root
			letter.letter = l
			letter.position = Vector2(x + letter.size.x / 2.0, 0.0)
			letter.start_global_position = letter.global_position
			letter.font = font
			x += letter.size.x
