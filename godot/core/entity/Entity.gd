extends KinematicBody2D
class_name Entity

signal direction_changed(new_direction)

var look_direction : Vector2 = Vector2(1, 0) setget set_look_direction


func take_damage(attacker, amount, effect=null) -> void:
	if self.is_a_parent_of(attacker):
		return
	# @TODO knockback
	# @TODO take damage


func set_dead(value) -> void:
	set_process_input(not value)
	set_physics_process(not value)
	$CollisionShape2D.disabled = value
	$Hitbox/CollisionShape2D.disabled = value


func set_look_direction(value) -> void:
	look_direction = value
	emit_signal("direction_changed", value)