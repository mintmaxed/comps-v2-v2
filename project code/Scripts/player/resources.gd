class_name Resources
extends Node

@export var health : float = 100
@export var max_health : float = 100

var used_powerup : bool = false

var powerups : Array[String]

func lose_health(amount : float):
	health -= amount
	if health < 1:
		# model.current_move.try_force_move("death")
		pass
		
func gain_health(amount : float):
	if health + amount <= max_health:
		health += amount
	else:
		health = max_health
		
func use_powerup(power : String):
	used_powerup = true
	
	
		
func move_available(move : Move):
	# powerups available
	# sprint cooldowns
	# not doing stamina i think
	return true
		

