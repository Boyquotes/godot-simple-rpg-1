extends MotionState

export var MAX_WALK_SPEED : = 120.0
export var MAX_RUN_SPEED : = 80.0


func enter() -> void:
	speed = 0.0
	velocity = Vector2()

	var input_direction : Vector2 = get_input_direction()
	update_look_direction(input_direction)
	update_animation(input_direction)
	

func handle_input(event : InputEvent) -> void:
	.handle_input(event)


func update(delta : float) -> void:
	var input_direction : Vector2 = get_input_direction()
	if not input_direction:
		emit_signal("finished", "idle")
	update_look_direction(input_direction)

	speed = MAX_RUN_SPEED if Input.is_action_pressed("run") else MAX_WALK_SPEED
	var collision_info : KinematicCollision2D = move(speed, input_direction)
	if not collision_info:
		return
	if speed == MAX_RUN_SPEED and collision_info.collider.is_in_group("environment"):
		return


func move(speed : float, direction : Vector2) -> KinematicCollision2D:
	velocity = direction.normalized() * speed
	owner.move_and_slide(velocity, Vector2(), 5, 2)
	if owner.get_slide_count() == 0:
		return null
	return owner.get_slide_collision(0)


func update_animation(motion : Vector2) -> void:
	var animation : String = ''
	if motion.x > 0:
		animation = "walk_right"
	elif motion.x < 0:
		animation = "walk_left"
	elif motion.y < 0:
		animation = "walk_up"
	elif motion.y > 0:
		animation = "walk_down"
		
	if animation == '':
		return

	var animation_player : AnimationPlayer = owner.get_node("AnimationPlayer")
	if animation_player.current_animation != animation:
		animation_player.play(animation)
