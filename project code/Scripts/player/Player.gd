extends CharacterBody3D

# TODO want to include here:
# current weapon/class
# assign skeletons and things

@onready var input_gatherer = $input as InputGatherer
@onready var model = $Model as PlayerModel

func _ready():
	pass
	
func _physics_process(delta):
	# called every frame update. main interface with input
	var input = input_gatherer.gather_input()
	model.update(input, delta)
	
	input.queue_free()
