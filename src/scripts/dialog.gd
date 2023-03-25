extends AcceptDialog


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.taskDone:
		ok_button_text = "OK"
		check_rune()
	else:
		dialog_text = Quests.prompt_dialog[Global.curJob]

func check_rune():
	if Global.curRune == Quests.correct_response[Global.curJob]:
		dialog_text = Quests.success_dialog[Global.curJob]
	elif Global.curRune == Quests.partial_response[Global.curJob]:
		dialog_text = Quests.partial_dialog[Global.curJob]
	else:
		dialog_text = Quests.failure_dialog[Global.curJob]
