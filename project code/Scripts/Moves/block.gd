class_name block
extends Move

const COMBO_TIMING = 0.5
const TRANSITION_TIMING = 0.75
var hit_damage = 10 # should be a function of player stats

func _ready():
	animation = "Block"
	move_name = "block"

func update(_input : InputPackage, delta : float):
	pass
	#player.move_and_slide()
	# move_player(delta)
	# player.model.active_weapon.is_attacking = right_weapon_hurts()

	
func move_player(delta : float):
	player.move_and_slide()
	# var delta_pos = get_root_position_delta(delta)
	# delta_pos.y = 0
	#  player.velocity = player.get_quaternion() * delta_pos / delta

# TODO: fix how this works! you can see what it's trying to do, won't work with our implementation though
#func form_hit_data(weapon : Weapon) -> HitData:
	#var hit = HitData.new()
	#hit.damage = hit_damage
	#hit.hit_move_animation = animation
	#hit.can_block = is_blockable()
	#hit.weapon = player.model.active_weapon
	#return hit

func on_enter_state():
	player.velocity = Vector3.ZERO
	
func on_exit_state():
	# player.model.active_weapon.hitbox_ignore_list.clear()
	# player.model.active_weapon.is_attacking = false
	pass
