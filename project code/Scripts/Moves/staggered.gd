extends Move

const ANIMATION_END = 0.67

func _ready():
	animation = "Hit_A"

func default_lifecycle(input : InputPackage):
	if works_longer_than(ANIMATION_END):
		return best_eligible_input(input)
	return "okay"
	
func on_enter_state():
	player.model.animator.speed_scale = 1
	
func on_exit_state():
	player.model.animator.speed_scale = 1.3
