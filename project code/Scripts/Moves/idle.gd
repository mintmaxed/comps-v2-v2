class_name Idle
extends Move

func _ready():
	animation = "Idle"

func default_lifecycle(input) -> String:
	return best_eligible_input(input)
	
func on_enter_state():
	player.velocity = Vector3.ZERO

