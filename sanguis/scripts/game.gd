extends Node2D

var items_collected := 0
var time_elapsed := 0.0

func _ready() -> void:
	get_tree().paused = false
	$CanvasLayer/TimerLabel.visible = Global.show_timer
	$player/Camera2D.make_current()
	$CanvasLayer/Blood_effect_feedback.hide()
	$CanvasLayer/DiedLabel.hide()
	$CanvasLayer/Tracker/HBoxContainer/blood.modulate.a = 0.25
	$CanvasLayer/Tracker/HBoxContainer/box.modulate.a = 0.25
	$CanvasLayer/Tracker/HBoxContainer/cone.modulate.a = 0.25
	$CanvasLayer/Tracker/HBoxContainer/diamond.modulate.a = 0.25
	$CanvasLayer/Tracker/HBoxContainer/cube.modulate.a = 0.25
	$CanvasLayer/Blood_transition/AnimatedSprite2D.play("fade_out")
	await $CanvasLayer/Blood_transition/AnimatedSprite2D.animation_finished
	$CanvasLayer/Blood_transition.hide()
	$CanvasLayer/HelpLabel.show()
	await get_tree().create_timer(10.0).timeout
	$CanvasLayer/HelpLabel.hide()

func _process(delta: float) -> void:
	if Global.show_timer:
		time_elapsed += delta
		$CanvasLayer/TimerLabel.text = "Time: %.2f" % time_elapsed

func open_door1():
	if items_collected >= 3:
		$CanvasLayer/HelpLabel.text = "3 Itmes Collected! Door 1 Opened."
		$map/Door/Door1/Door_Dust.emitting = true
		$map/Door/Door1/Camera2D.screen_shake(15,8.0)
		$map/Door_Dusts/Door_Dust1.emitting = true
		await get_tree().create_timer(1.0).timeout
		$map/Door/Door1/Camera2D.make_current()
		await get_tree().create_timer(1.0).timeout
		$map/Door/Door1/AnimationPlayer.play("open_door")
		await get_tree().create_timer(4.0).timeout
		$player/Camera2D.make_current()
		$map/Door/Door1/Door_Dust.emitting = false
		$map/Door_Dusts/Door_Dust1.emitting = false
	else:
		print("Not enough items.")

func open_door2():
	if items_collected >= 5:
		$CanvasLayer/HelpLabel.text = " 5 Items Collected! Exit Opened."
		$map/Door/Door2/Door_Dust2.emitting = true
		$map/Door/Door2/Camera2D.screen_shake(15,8.0)
		$map/Door_Dusts/Door_Dust2.emitting = true
		await get_tree().create_timer(1.0).timeout
		$map/Door/Door2/Camera2D.make_current()
		await get_tree().create_timer(1.0).timeout
		$map/Door/Door2/AnimationPlayer.play("open_door")
		await get_tree().create_timer(4.0).timeout
		$player/Camera2D.make_current()
		$map/Door/Door2/Door_Dust2.emitting = false
		$map/Door_Dusts/Door_Dust2.emitting = false
	else: 
		print("Not enough items.")

func _on_killzone_lava_body_entered(body: Node2D) -> void:
	$CanvasLayer/HelpLabel.hide()
	$CanvasLayer/DiedLabel.show()
	get_tree().paused = true
	$player/AnimatedSprite2D.play("die")
	await $player/AnimatedSprite2D.animation_finished
	$CanvasLayer/DiedLabel.hide()
	$CanvasLayer/Blood_transition.show()
	$CanvasLayer/Blood_transition/AnimatedSprite2D.play("fade_in")
	get_tree().reload_current_scene()

func _on_killzone_lava_2_body_entered(body: Node2D) -> void:
	$CanvasLayer/HelpLabel.hide()
	$CanvasLayer/DiedLabel.show()
	get_tree().paused = true
	$player/AnimatedSprite2D.play("die")
	await $player/AnimatedSprite2D.animation_finished
	$CanvasLayer/DiedLabel.hide()
	$CanvasLayer/Blood_transition.show()
	$CanvasLayer/Blood_transition/AnimatedSprite2D.play("fade_in")
	get_tree().reload_current_scene()

func _on_blood_body_entered(body: Node2D) -> void:
	$Items/blood.queue_free()
	items_collected += 1
	print("Items Collected: " + str(items_collected))
	$CanvasLayer/HelpLabel.show()
	$CanvasLayer/HelpLabel.text = "Items Collected: " + str(items_collected)
	open_door1()
	$CanvasLayer/TextureProgressBar.value += 1.0
	$CanvasLayer/Blood_effect_feedback.show()
	$CanvasLayer/Blood_effect_feedback/AnimatedSprite2D.play("blood_feedback")
	await $CanvasLayer/Blood_effect_feedback/AnimatedSprite2D.animation_finished
	$CanvasLayer/Blood_effect_feedback.hide()
	$CanvasLayer/Tracker/HBoxContainer/blood.modulate.a = 1.0
	await get_tree().create_timer(10.0).timeout
	$CanvasLayer/HelpLabel.hide()

func _on_box_body_entered(body: Node2D) -> void:
	$Items/box.queue_free()
	items_collected += 1
	print("Items Collected: " + str(items_collected))
	$CanvasLayer/HelpLabel.show()
	$CanvasLayer/HelpLabel.text = "Items Collected: " + str(items_collected)
	open_door1()
	$CanvasLayer/TextureProgressBar.value += 1.0
	$CanvasLayer/Blood_effect_feedback.show()
	$CanvasLayer/Blood_effect_feedback/AnimatedSprite2D.play("blood_feedback")
	await $CanvasLayer/Blood_effect_feedback/AnimatedSprite2D.animation_finished
	$CanvasLayer/Blood_effect_feedback.hide()
	$CanvasLayer/Tracker/HBoxContainer/box.modulate.a = 1.0
	await get_tree().create_timer(10.0).timeout
	$CanvasLayer/HelpLabel.hide()

func _on_cone_body_entered(body: Node2D) -> void:
	$Items/cone.queue_free()
	items_collected += 1
	print("Items Collected: " + str(items_collected))
	$CanvasLayer/HelpLabel.show()
	$CanvasLayer/HelpLabel.text = "Items Collected: " + str(items_collected)
	open_door1()
	$CanvasLayer/TextureProgressBar.value += 1.0
	$CanvasLayer/Blood_effect_feedback.show()
	$CanvasLayer/Blood_effect_feedback/AnimatedSprite2D.play("blood_feedback")
	await $CanvasLayer/Blood_effect_feedback/AnimatedSprite2D.animation_finished
	$CanvasLayer/Blood_effect_feedback.hide()
	$CanvasLayer/Tracker/HBoxContainer/cone.modulate.a = 1.0
	await get_tree().create_timer(10.0).timeout
	$CanvasLayer/HelpLabel.hide()

func _on_cube_body_entered(body: Node2D) -> void:
	$Items/cube.queue_free()
	items_collected += 1
	print("Items Collected: " + str(items_collected))
	$CanvasLayer/HelpLabel.show()
	$CanvasLayer/HelpLabel.text = "Items Collected: " + str(items_collected)
	open_door2()
	$CanvasLayer/TextureProgressBar.value += 1.0
	$CanvasLayer/Blood_effect_feedback.show()
	$CanvasLayer/Blood_effect_feedback/AnimatedSprite2D.play("blood_feedback")
	await $CanvasLayer/Blood_effect_feedback/AnimatedSprite2D.animation_finished
	$CanvasLayer/Blood_effect_feedback.hide()
	$CanvasLayer/Tracker/HBoxContainer/cube.modulate.a = 1.0
	await get_tree().create_timer(10.0).timeout
	$CanvasLayer/HelpLabel.hide()

func _on_diamond_body_entered(body: Node2D) -> void:
	$Items/diamond.queue_free()
	items_collected +=1
	print("Items Collected: " + str(items_collected))
	$CanvasLayer/HelpLabel.show()
	$CanvasLayer/HelpLabel.text = "Items Collected: " + str(items_collected)
	open_door2()
	$CanvasLayer/TextureProgressBar.value += 1.0
	$CanvasLayer/Blood_effect_feedback.show()
	$CanvasLayer/Blood_effect_feedback/AnimatedSprite2D.play("blood_feedback")
	await $CanvasLayer/Blood_effect_feedback/AnimatedSprite2D.animation_finished
	$CanvasLayer/Blood_effect_feedback.hide()
	$CanvasLayer/Tracker/HBoxContainer/diamond.modulate.a = 1.0
	await get_tree().create_timer(10.0).timeout
	$CanvasLayer/HelpLabel.hide()

func _on_exit_body_entered(body: Node2D) -> void:
	get_tree().paused = true
	$CanvasLayer/Blood_transition.show()
	await get_tree().create_timer(1.0).timeout
	$CanvasLayer/Blood_transition/AnimatedSprite2D.play("fade_in")
	await $CanvasLayer/Blood_transition/AnimatedSprite2D.animation_finished
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
