extends CharacterBody2D

var gravity := 18.5
var jump_height := -320.0

func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	var input_x: float = Input.get_axis("move_left", "move_right")
	velocity.x = input_x * get_player_speed()
	
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = jump_height
	velocity.y += gravity
	move_and_slide()
	$AnimatedSprite2D.play(frame_animation())

func get_player_speed() -> float:
	if Input.is_action_pressed("sprint"):
		return 130.0
	if Input.is_action_pressed("move_down")  and is_on_floor():
		return 25.0
	return 110.0

func frame_animation() -> String:
	var is_moving: bool = velocity.x != 0
	if is_moving:
		$AnimatedSprite2D.flip_h = velocity.x < 0
	
	if !is_on_floor():
		return "jump" if velocity.y < 0 else "walk"
		
	if is_moving:
		if Input.is_action_pressed("sprint"):
			return "walk"
		if Input.is_action_pressed("move_down"):
			return "crouch_walk"
		return "walk"
			
	if Input.is_action_pressed("move_down"):
		return "crouch_walk"
	return "walk"
	
