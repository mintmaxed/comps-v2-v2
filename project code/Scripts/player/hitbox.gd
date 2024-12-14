class_name Hitbox
extends Area3D

@export var model : Node

# Called when the node enters the scene tree for the first time.
func _ready():
	area_entered.connect(on_contact)
	
func on_contact(area):
	print("hitbox detection against ", model.active_weapon)	
	if is_eligible_attack(area):
		model.current_move.react_on_hit(area.get_hit_data())
		print("eligible attack against ", model.active_weapon)

func is_eligible_attack(area : Node3D) -> bool:
	if (area is Weapon) && (area != model.active_weapon) && (area.is_attacking):
		return true
	return false
