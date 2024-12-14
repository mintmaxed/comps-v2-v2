extends CharacterBody3D

@export var player : CharacterBody3D

@export var speed : float = 3
@export var return_speed : float = 9

@export var attack_radius : float = 2
@export var evade_radius : float = 5
@export var attack_count : int = 1

@onready var model = $EnemyModel as EnemyModel

var current_attack_count : int = 0

func _ready():
	pass

func _physics_process(delta):
	#var input = behavior.create_input(delta)
	#model.update(input, delta)
	#
	#input.queue_free()
	
	pass
