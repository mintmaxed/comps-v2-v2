class_name sword_1
extends Move

const TRANSITION_TIMING = 0.75
const ANIMATION_END = 1 # ?????????????
var hit_damage = 10 

func _ready():
	animation = "1H_Melee_Attack_Slice_Diagonal"
	move_name = "sword_1"
	
func default_lifecycle(input : InputPackage) -> String:
	var best_eligible = best_eligible_input(input)
	if works_longer_than(TRANSITION_TIMING):
		return best_eligible
	elif works_longer_than(ANIMATION_END):
		# it doesn't seem like this bloc is ever reached, but i haven't tested *every* case
		# and it's not doing any harm, so
		return best_eligible
	return "okay"

func update(_input : InputPackage, delta : float):
	move_player(delta)
	if (works_between(0.3,0.5)):
		player.model.active_weapon.is_attacking = true
	else:
		player.model.active_weapon.is_attacking = false
	#player.move_and_slide()
	# move_player(delta)
	# player.model.active_weapon.is_attacking = right_weapon_hurts()

	
func move_player(delta : float):
	# var delta_pos = get_root_position_delta(delta)
	# delta_pos.y = 0
	#  player.velocity = player.get_quaternion() * delta_pos / delta

	player.move_and_slide()

func form_hit_data(weapon : Weapon) -> HitData:
	var hit = HitData.new()
	hit.damage = hit_damage
	hit.hit_move_animation = animation
		# figure this out
	# hit.can_block = is_blockable()
	hit.weapon = player.model.active_weapon
	return hit

func on_enter_state():
	player.velocity = Vector3.ZERO
	
func on_exit_state():
	player.model.active_weapon.hitbox_ignore_list.clear()
	player.model.active_weapon.is_attacking = false
	pass
