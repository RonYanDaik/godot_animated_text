@tool
extends EditorPlugin


func _enter_tree() -> void:
	add_custom_type("AnimatedText", "Node2D", preload("animated_text.gd"), null)
	add_custom_type("AnimatedTextGenerator", "Node2D", preload("generator.gd"), null)
	add_custom_type("AnimatedTextEffectFade", "Node", preload("effects/fade.gd"), null)
	add_custom_type("AnimatedTextEffectFunction", "Node", preload("effects/function.gd"), null)
	add_custom_type("AnimatedTextEffectPathFollow", "Node", preload("effects/path_follow.gd"), null)
	add_custom_type("AnimatedTextEffectScale", "Node", preload("effects/scale.gd"), null)
	add_custom_type("AnimatedTextEffectTriggerParticles", "Node", preload("effects/trigger_particles.gd"), null)


func _exit_tree() -> void:
	remove_custom_type("AnimatedText")
	remove_custom_type("AnimatedTextGenerator")
	remove_custom_type("AnimatedTextEffectFade")
	remove_custom_type("AnimatedTextEffectFunction")
	remove_custom_type("AnimatedTextEffectPathFollow")
	remove_custom_type("AnimatedTextEffectScale")
	remove_custom_type("AnimatedTextEffectTriggerParticles")
