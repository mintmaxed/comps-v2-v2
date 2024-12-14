class_name PlayerCombat
extends Node

@onready var model = $".." as PlayerModel

static var inputs_priority : Dictionary = {
	 "hit_1" : 1,
	 "hit_2" : 2,
	 "shield" : 3
}

func contextualize(new_input : InputPackage) -> InputPackage:
	translate_inputs(new_input)
	filter_with_resources(new_input)
	return new_input


func translate_inputs(input : InputPackage):
	if not input.combat_actions.is_empty():
		input.combat_actions.sort_custom(combat_action_priority_sort)
		var best_input_action : String = input.combat_actions[0]
		var translated_into_move_name : String = model.active_weapon.basic_attacks[best_input_action]
		input.actions.append(translated_into_move_name)


func filter_with_resources(input : InputPackage):
	if model.resources.statuses.has("fatigue"):
		input.actions.erase("sprint")


static func combat_action_priority_sort(a : String, b : String):
	if inputs_priority[a] > inputs_priority[b]:
		return true
	else:
		return false
