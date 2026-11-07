extends Control

func _ready() -> void:
	$CanvasLayer/Fade_transition.hide()
	$CanvasLayer/Blood_transition.hide()
	$CanvasLayer/Fade_transition.show()
	$CanvasLayer/Fade_transition/AnimationPlayer.play("fade_out")
	await $CanvasLayer/Fade_transition/AnimationPlayer.animation_finished
	$CanvasLayer/Fade_transition.hide()

func _process(delta: float) -> void:
	pass

func _on_start_pressed() -> void:
	$CanvasLayer/Fade_transition.show()
	$CanvasLayer/Fade_transition/AnimationPlayer.play("fade_in")
	await $CanvasLayer/Fade_transition/AnimationPlayer.animation_finished
	get_tree().change_scene_to_file("res://scenes/loading_screen.tscn") 

func _on_options_pressed() -> void:
	$CanvasLayer/Fade_transition.show()
	$CanvasLayer/Fade_transition/AnimationPlayer.play("fade_in")
	await $CanvasLayer/Fade_transition/AnimationPlayer.animation_finished
	$CanvasLayer/Fade_transition/AnimationPlayer.play("fade_out")
	await $CanvasLayer/Fade_transition/AnimationPlayer.animation_finished
	$CanvasLayer/Fade_transition.hide()

func _on_exit_pressed() -> void:
	$CanvasLayer/Fade_transition.show()
	$CanvasLayer/Fade_transition/AnimationPlayer.play("fade_in")
	await $CanvasLayer/Fade_transition/AnimationPlayer.animation_finished
	get_tree().quit()
