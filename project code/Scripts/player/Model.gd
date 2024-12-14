class_name PlayerModel
extends Node

@onready var player = $".."
@onready var animator = $"AnimationPlayer"
@onready var resources = $resources as Resources
@onready var hitbox = $hitbox as Hitbox

var current_move : Move 
@onready var active_weapon = $"../Knight/Rig/Skeleton3D/1H_Sword/sword" as Sword

@onready var moves = {
	"idle" : $idle,
	"run" : $run,
	"sword_1" : $sword_1,
	"block" : $block,
	"staggered" : $staggered,
	"death" : $death,
	# parried
}

func _ready():
	
	current_move = moves["idle"]
	for move in moves.values():
		move.player = player
		move.resources = resources

func update(input : InputPackage, delta : float):
	var relevance = current_move.check_relevance(input)
		# later on check_relevance will need to be updated to account for the resource layer
	if relevance != "okay":
		switch_to(relevance)
	current_move.update(input, delta)
	animator.play(current_move.animation)
	
func switch_to(state : String):
	current_move.on_exit_state()
	current_move = moves[state]
	current_move.mark_enter_state()
	current_move.on_enter_state()



