extends Node

@export var model : EnemyModel

func create_input(delta) -> InputPackage:
	var new_enemy_input = InputPackage.new()
	new_enemy_input.actions.append("idle")
	
	
	
	return new_enemy_input
