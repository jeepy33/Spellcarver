extends Node

var starting_quadrant = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	var rng = RandomNumberGenerator.new()
	Global.master_quadrant = rng.randi_range(0,3)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
