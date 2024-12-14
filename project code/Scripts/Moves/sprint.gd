class_name Sprint
extends Move

@export var SPRINT_SPEED = 6.0


func check_relevance(input : InputPackage):
	input.actions.sort_custom(moves_priority_sort)
	if input.actions[0] == "sprint":
		return "okay"
	return input.actions[0]
	
func update(input : InputPackage, delta : float):
	player.velocity = velocity_by_input(input, delta)
	player.move_and_slide()
	
func velocity_by_input(input : InputPackage, delta : float) -> Vector3:
	# the arrow specifies return type
	var new_velocity = player.velocity
	
	var direction = (player.transform.basis * Vector3(input.input_direction.x, 0, input.input_direction.y)).normalized()
	new_velocity.x = direction.x * SPRINT_SPEED
	new_velocity.z = direction.z * SPRINT_SPEED
	
	if !player.is_on_floor():
		new_velocity.y -= gravity * delta
	
	return new_velocity
