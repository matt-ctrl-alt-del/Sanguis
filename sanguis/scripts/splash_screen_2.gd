extends Control

func _ready() -> void:
	$matt_not_found.hide()
	$Godot.play("godot")
	await get_tree().create_timer(5.0).timeout
	$matt_not_found.show()
	$Godot.hide()
	$matt_not_found.play("matt_not_found")
	await get_tree().create_timer(4.0).timeout
	print("done")
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _process(delta: float) -> void:
	pass
