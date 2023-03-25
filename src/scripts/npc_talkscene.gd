extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	texture = load("res://assets/" + str(Global.curJob) + "_talksprite.png")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
