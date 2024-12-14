class_name EnemyMove
extends Node

var player : CharacterBody3D
var mob : CharacterBody3D
var resources : Resources
var type : String

# fields to redefine
@export var animation : String
@export var backend_animation : String
@export var tracking_angular_speed : float = 10

@onready var move_complete : bool = false
@onready var force_move_complete : bool = false

var move_name : String

var enter_state_time : float
var frame_length = 0.016

func update(delta : float):
	pass
	
func check_transition(delta) -> Array:
	return [true, "needs transition logic " + move_name]
	
func react_on_hit(hit : HitData):
	resources.lose_health(hit.damage)
	# something about getting parried?
	# if (is_interruptable()):
	return "staggered"
	
func update_resources(delta : float):
	resources.update(delta)
	
func get_move_complete():
	return move_complete

func get_force_move_complete():
	return force_move_complete

func on_enter_state():
	move_complete = false
	force_move_complete = false

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

func works_between(start : float, finish : float) -> bool:
	var progress = get_progress()
	if progress >= start and progress <= finish:
		return true
	return false
