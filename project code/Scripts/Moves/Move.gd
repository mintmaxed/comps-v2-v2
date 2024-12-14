class_name Move
extends Node

# universal
var player : CharacterBody3D
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var resources : Resources

# fields to redefine
@export var animation : String
@export var backend_animation : String
@export var tracking_angular_speed : float = 10

var move_name : String

var has_override_move : bool = false
var override_move : String = "error: no move override"

var enter_state_time : float
var frame_length = 0.016

# priority
static var moves_priority : Dictionary = {
	# higher number = higher priority when deciding which input to use
	"idle" : 1,
	"run" : 2,
	"sword_1" : 3,
	"axe_1" : 3,
	"knife_1" : 3,
	"block" : 4,
	"sprint" : 5,
	"staggered" : 6,
	"death" : 7
}

static func moves_priority_sort(a : String, b : String):
	if moves_priority[a] > moves_priority[b]:
		return true
	else:
		return false

func update(input : InputPackage, delta : float):
	pass
	
func check_relevance(input : InputPackage) -> String:
	if has_override_move:
		print("check_relevance override ", override_move)
		has_override_move = false
		return override_move
	
	return default_lifecycle(input)
	
func best_eligible_input(input : InputPackage) -> String:
	input.actions.sort_custom(moves_priority_sort)
	for action in input.actions:
		if resources.move_available(player.model.moves[action]):
			if player.model.moves[action] == self:
				return "okay"
			else:
				return action
	return "what happened"
	
func react_on_hit(hit : HitData):
	# if (is_vulnerable()):
		#  resources.lose_health(hit.damage)
	# if (is_interruptable()):
		print("try_move_override", has_override_move)
		try_move_override("staggered")
	
	
func try_move_override(new_move_override : String):
	if (!has_override_move):
		has_override_move = true
		override_move = new_move_override
	elif (moves_priority[new_move_override] >= moves_priority[override_move]):
		override_move = new_move_override
		
func default_lifecycle(input : InputPackage) -> String:
	return "implement default lifecycle"
	
func update_resources(delta : float):
	resources.update(delta)
		
# these will work once you actually hook up the backend animations lol
#func is_vulnerable() -> bool:
	#return moves_data_repo.get_vulnerable(backend_animation, get_progress())
#
#func is_interruptable() -> bool:
	#return moves_data_repo.get_interruptable(backend_animation, get_progress())
#
#func is_parryable() -> bool:
	#return moves_data_repo.get_parryable(backend_animation, get_progress())

func on_enter_state():
	pass
	
func on_exit_state():
	pass
	
func mark_enter_state():
	enter_state_time = Time.get_unix_time_from_system()

func get_progress() -> float:
	var now = Time.get_unix_time_from_system()
	return now - enter_state_time    	    	   
		
func works_longer_than(time : float) -> bool:
	if get_progress() >= time:
		return true
	return false

func works_less_than(time : float) -> bool:
	if get_progress() < time: 
		return true
	return false
	
func works_between(start : float, end : float) -> bool:
	var progress = get_progress()
	if (progress >= start) && (progress <= end):
		return true
	return false
