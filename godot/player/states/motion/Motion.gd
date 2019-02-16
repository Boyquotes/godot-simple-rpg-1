# Collection of important methods to handle direction and animation
extends State
class_name MotionState

var speed : = 0.0
var velocity : Vector2 = Vector2()

func handle_input(event : InputEvent) -> void:
	if event.is_action_pressed("simulate_damage"):
		emit_signal("finished", "stagger")


func get_input_direction() -> Vector2:
	var input_direction : Vector2 = Vector2()
	input_direction.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	input_direction.y = int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))
	return input_direction


func update_look_direction(direction : Vector2) -> void:
	if direction and owner.look_direction != direction:
		owner.look_direction = direction