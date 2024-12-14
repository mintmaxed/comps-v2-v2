extends EnemyMove

const ANIMATION_END = 0.67

func _ready():
	animation = "Hit_A"

func check_transition(delta) -> Array:
	if works_longer_than(ANIMATION_END):
		return [true, "huh"]
	return [false, ""]
