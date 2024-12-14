class_name knife_1
extends EnemyMove

const TRANSITION_TIMING = 0.86
const ANIMATION_END = 1 # ?????????????
var hit_damage = 10 

func _ready():
	animation = "1H_Melee_Attack_Stab"
	move_name = "knife_1"

func check_transition(delta):
	if works_longer_than(TRANSITION_TIMING):
		if player.global_position.distance_to(mob.global_position) > mob.attack_radius:
			return [true, "pursue"]
		elif mob.attack_count > mob.current_attack_count:
			return [true, "knife_1"]
		elif mob.attack_count <= mob.current_attack_count:
			return [true, "evade"]
	return [false, '']

func update(_delta : float):
	face_character()
	if (works_between(0.3,0.5)):
		mob.model.active_weapon.is_attacking = true
	else:
		mob.model.active_weapon.is_attacking = false
	
func face_character():
	if works_less_than(0.15):
		mob.look_at(player.global_position)

func form_hit_data(weapon : Weapon) -> HitData:
	var hit = HitData.new()
	hit.damage = hit_damage
	hit.hit_move_animation = animation
		# figure this out
	# hit.can_block = is_blockable()
	hit.weapon = mob.model.active_weapon
	mob.current_attack_count += 1
	
	return hit

func on_enter_state():
	mob.velocity = Vector3.ZERO
	
func on_exit_state():
	mob.model.active_weapon.hitbox_ignore_list.clear()
	mob.model.active_weapon.is_attacking = false
	pass
