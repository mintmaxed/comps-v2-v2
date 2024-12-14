class_name EnemyModel
extends Node

# very similar to the player model, but accounts for the complexity needed by the behavior decision making.

@export var character_type : String = "enemy"

@onready var mob = $".."
@onready var animator = $"AnimationPlayer"
@onready var resources = $resources as Resources

var current_move : EnemyMove 
var active_weapon : Weapon

@onready var weapons = {
	"axe" = $"../Barbarian/Rig/Skeleton3D/2H_Axe/axe" as WeaponAxe,
	"knife" = $"../Rogue/Rig/Skeleton3D/Knife/knife" as Knife
}

#@onready var behaviors = {
	#"tank" : ,
	#"dash" : 
	# this might be something that can just be passed through
#}

@onready var moves = {
	"idle" : $idle, 
	"pursue" : $pursue,
	"evade" : $evade,
	"staggered" : $staggered,
	"axe_1" : $axe_1,
	"knife_1" : $knife_1,
	# "block" : $block,
	# "death" : $death
	# parried
}

func _ready():
	if character_type == "barbarian":
		active_weapon = weapons["axe"]
		# set behavior controllers?
	elif character_type == "rogue":
		active_weapon = weapons["knife"]
		animator.speed_scale = 3
	
	current_move = moves["idle"]
	
	for move in moves.values():
		move.player = mob.player
		move.mob = mob
		move.resources = resources
		move.type = character_type

func _physics_process (delta):
	
	var verdict = current_move.check_transition(delta)
	if (verdict[0]):
		switch_to(verdict[1])

	current_move.update(delta)
	animator.play(current_move.animation)
	
func switch_to(state : String):
	current_move.on_exit_state()
	current_move = moves[state]
	current_move.mark_enter_state()
	current_move.on_enter_state()



