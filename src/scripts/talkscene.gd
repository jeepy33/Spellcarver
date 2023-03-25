extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.taskDone:
		print(str("task is done"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_dialog_confirmed():
	if not Global.taskDone:
		Global.acceptedJob = true
	else:
		Global.taskDone = false
		Global.curJob += 1
		Global.usePrevSprite = true
	get_tree().change_scene_to_file("res://src/scenes/shop.tscn")


