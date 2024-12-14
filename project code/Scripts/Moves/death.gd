extends Move

const ANIMATION_END = 2.6333

func _ready():
	animation = "Death_B"

func default_lifecycle(_input : InputPackage):
	if works_longer_than(ANIMATION_END):
		return "idle"
	return "okay"
