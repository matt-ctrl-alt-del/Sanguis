extends CharacterBody2D

const SPEED = 120.0
const JUMP_VELOCITY = -255.0

func _process(delta: float) -> void:
	if is_on_floor() == false:
		$AnimatedSprite2D.play("jump")

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$AnimatedSprite2D.play("jump")

	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
		if velocity.x < 0:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("walk")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
