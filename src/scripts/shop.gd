extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$player.start($player_start.position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_touching():
	print(str('player touching'))
