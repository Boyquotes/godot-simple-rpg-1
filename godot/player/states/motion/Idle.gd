extends MotionState


func enter() -> void:
	update_animation(owner.look_direction)


func handle_input(event : InputEvent) -> void:
	.handle_input(event)


func update(delta : float) -> void:
	var input_direction : = get_input_direction()
	if input_direction:
		emit_signal("finished", "move")


func update_animation(motion : Vector2) -> void:
	var animation : String = ''
	if motion.x > 0:
		animation = "idle_right"
	elif motion.x < 0:
		animation = "idle_left"
	elif motion.y < 0:
		animation = "idle_up"
	elif motion.y > 0:
		animation = "idle_down"

	if animation == '':
		return

	var animation_player : AnimationPlayer = owner.get_node("AnimationPlayer")
	if animation_player.current_animation != animation:
		animation_player.play(animation)