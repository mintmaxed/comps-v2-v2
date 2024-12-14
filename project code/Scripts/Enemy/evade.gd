class_name Evade
extends EnemyMove


func _onready():
	animation = "Running_A"
	
func check_transition(delta):
	if player.global_position.distance_to(mob.global_position) >= mob.evade_radius:
		return [true, 'pursue']
	return [false, '']
	

func update(delta):
	mob.velocity = mob.global_position.direction_to(player.global_position) * mob.speed
	mob.look_at(player.global_position)
	mob.move_and_slide()
