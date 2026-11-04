extends Node2D


func _ready() -> void:
	get_tree().paused = true
	$CanvasLayer/Blood_transition/AnimatedSprite2D.play("fade_out")
	await $CanvasLayer/Blood_transition/AnimatedSprite2D.animation_finished
	$CanvasLayer/Blood_transition.hide()
	get_tree().paused = false


func _process(delta: float) -> void:
	pass
