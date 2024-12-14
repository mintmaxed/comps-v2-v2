class_name Weapon
extends Area3D

@export var holder : Node
@export var base_damage : float = 10

var hitbox_ignore_list : Array[Area3D]
var is_attacking : bool
var basic_attacks : Dictionary

func get_hit_data():
	print("hit by weapon")
	return HitData.blank()


