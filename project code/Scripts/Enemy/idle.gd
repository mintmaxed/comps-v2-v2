extends EnemyMove

func _ready():
	animation = "Idle"

func check_transition(delta) -> Array:
	# if mob.health <= 0:
		# return [false, '']
	if player.global_position.distance_to(mob.global_position) > mob.attack_radius:
		return [true, "pursue"]
	return [false, ""]
