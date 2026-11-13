extends CanvasLayer

func _ready() -> void:
	visible = false
	get_tree().paused = false
	$About_Label.hide()
	$Fade_transition/AnimationPlayer.play("fade_out")
	await $Fade_transition/AnimationPlayer.animation_finished
	$Fade_transition.hide()

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		if get_tree().paused:
			visible = false
			get_tree().paused = false
		else:
			visible = true
			get_tree().paused = true

func _on_resume_pressed() -> void:
	visible = false 
	get_tree().paused = false 

func _on_about_pressed() -> void:
	$About_Label.show()
	$About_Label.show_about_text() 

func _on_exit_pressed() -> void:
	$Fade_transition.show()
	$Fade_transition/AnimationPlayer.play("fade_in")
	await $Fade_transition/AnimationPlayer.animation_finished
	get_tree().quit() 
