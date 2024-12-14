class_name Pursue
extends EnemyMove
	
func _ready():
	animation = "Running_A"

func check_transition(delta):
	if player.global_position.distance_to(mob.global_position) < mob.attack_radius:
		if player.global_position.distance_to(mob.global_position) < mob.attack_radius + 1.5:
			# gives a little buffer space
			mob.current_attack_count = 0
		if type == "barbarian":
			return [true, "axe_1"]
		elif type == "rogue": # effectively just the 'else', but it helps to see the parameter
			return [true, "knife_1"]
	return [false, ""]


func update(delta):
	mob.velocity = mob.global_position.direction_to(player.global_position) * mob.speed
	mob.look_at(player.global_position)
	mob.move_and_slide()
