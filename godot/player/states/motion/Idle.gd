extends MotionState


func enter() -> void:
	owner.get_node("AnimationPlayer").play("idle")


func handle_input(event : InputEvent) -> void:
	.handle_input(event)


func update(delta : float) -> void:
	var input_direction : = get_input_direction()
	if input_direction:
		emit_signal("finished", "move")
