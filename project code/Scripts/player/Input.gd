class_name InputGatherer
extends Node

func gather_input() -> InputPackage:
	# this is the input reader, returns a package of what the inputs should become
	var new_input = InputPackage.new()
	
	new_input.actions.append("idle")
	
	# movement inputs
	new_input.input_direction = Input.get_vector("left", "right", "forward", "backward")
	if new_input.input_direction != Vector2.ZERO:
		new_input.actions.append("run")
		if Input.is_action_pressed("sprint"):
			# new_input.actions.append("sprint")
			pass
			
	# combat inputs
	if Input.is_action_just_pressed("hit_1"):
		new_input.actions.append("sword_1")
	if Input.is_action_just_pressed("hit_2"):
		pass
	if Input.is_action_just_pressed("shield"):
		new_input.actions.append("block")
		
	return new_input
