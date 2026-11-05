extends Node2D

func _ready() -> void:
	$CanvasLayer/DiedLabel.hide()
	get_tree().paused = true
	$CanvasLayer/Blood_transition/AnimatedSprite2D.play("fade_out")
	await $CanvasLayer/Blood_transition/AnimatedSprite2D.animation_finished
	$CanvasLayer/Blood_transition.hide()
	get_tree().paused = false

func _process(delta: float) -> void:
	pass

func _on_killzone_lava_body_entered(body: Node2D) -> void:
	$CanvasLayer/DiedLabel.show()
	get_tree().paused = true
	$player/AnimatedSprite2D.play("die")
	await $player/AnimatedSprite2D.animation_finished
	$CanvasLayer/DiedLabel.hide()
	$CanvasLayer/Blood_transition.show()
	$CanvasLayer/Blood_transition/AnimatedSprite2D.play("fade_in")
	get_tree().reload_current_scene()

func _on_killzone_lava_2_body_entered(body: Node2D) -> void:
	$CanvasLayer/DiedLabel.show()
	get_tree().paused = true
	$player/AnimatedSprite2D.play("die")
	await $player/AnimatedSprite2D.animation_finished
	$CanvasLayer/DiedLabel.hide()
	$CanvasLayer/Blood_transition.show()
	$CanvasLayer/Blood_transition/AnimatedSprite2D.play("fade_in")
	get_tree().reload_current_scene()
