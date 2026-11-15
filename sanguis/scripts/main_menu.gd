extends Control

func _ready() -> void:
	$CanvasLayer/Fade_transition.hide()
	$CanvasLayer/Blood_transition.hide()
	$VBoxContainer2.hide()
	if Global.show_timer:
		$VBoxContainer2/Show_timer.text = "Timer: ON   "
	else:
		$VBoxContainer2/Show_timer.text = "Timer: OFF   "
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
	get_tree().change_scene_to_file("res://scenes/prologue.tscn") 

func _on_exit_pressed() -> void:
	$CanvasLayer/Fade_transition.show()
	$CanvasLayer/Fade_transition/AnimationPlayer.play("fade_in")
	await $CanvasLayer/Fade_transition/AnimationPlayer.animation_finished
	get_tree().quit()

func _on_settings_pressed() -> void:
	$CanvasLayer/Fade_transition.show()
	$CanvasLayer/Fade_transition/AnimationPlayer.play("fade_in")
	await $CanvasLayer/Fade_transition/AnimationPlayer.animation_finished
	$VBoxContainer2.show()
	$CanvasLayer/Fade_transition/AnimationPlayer.play("fade_out")
	await $CanvasLayer/Fade_transition/AnimationPlayer.animation_finished
	$CanvasLayer/Fade_transition.hide()

func _on_fullscreen_pressed() -> void:
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)

func _on_show_timer_pressed() -> void:
	Global.show_timer = !Global.show_timer
	if Global.show_timer:
		$VBoxContainer2/Show_timer.text = "Timer: ON   "
	else: 
		$VBoxContainer2/Show_timer.text = "Timer: OFF   "
