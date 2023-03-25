extends AcceptDialog


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.taskDone:
		dialog_text = Quests.success_dialog[Global.curJob]
	else:
		dialog_text = Quests.prompt_dialog[Global.curJob]
