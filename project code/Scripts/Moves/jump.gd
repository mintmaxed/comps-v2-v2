class_name Jump
extends Move

@export var JUMP_VELOCITY = 3.0

func check_relevance(input : InputPackage):
	if player.is_on_floor():
		input.actions.sort_custom(moves_priority_sort)
		return input.actions[0]
	return "okay"

func update(input, delta):
	player.velocity.y -= gravity * delta
	player.move_and_slide()
	
func on_enter_state():
	player.velocity.y += JUMP_VELOCITY
