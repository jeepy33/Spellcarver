extends PathFollow2D

@export var runSpeed = 20
var startPath
var curDelta
signal pathComplete

# Called when the node enters the scene tree for the first time.
func _ready():
	startPath = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if startPath:
		set_progress(get_progress() + runSpeed * (delta))
		$npc.global_position = $npc.global_position
	else:
		curDelta = 0
	
	if get_progress_ratio() == 1.0:
		pathComplete.emit()



func _on_npc_timer_timeout():
	print(str('timer done'))
	startPath = true
