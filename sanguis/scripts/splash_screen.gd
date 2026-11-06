extends Control


func _ready() -> void:
	$matt_not_found.hide()
	$CanvasLayer/Fade_transition/AnimationPlayer.play("fade_out")
	await $CanvasLayer/Fade_transition/AnimationPlayer.animation_finished
	$godot.play("godot_splash")
	await get_tree().create_timer(5.0).timeout
	$matt_not_found.show()
	$godot.hide()
	$matt_not_found.play("matt_not_found_splash")
	await get_tree().create_timer(4.0).timeout
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _process(delta: float) -> void:
	pass
