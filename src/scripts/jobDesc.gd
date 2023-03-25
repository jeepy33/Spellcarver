extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	$description.text = str("You do not have any jobs right now.")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.acceptedJob:
		$description.text = Quests.job_desc[Global.curJob]
		
	$jobsCompleted.text = "# of Completed Jobs: " + str(Global.curJob)
