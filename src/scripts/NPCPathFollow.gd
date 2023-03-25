extends PathFollow2D

@export var runSpeed = 20
var startPath
var curDelta
var leave
var counter
signal pathComplete

# Called when the node enters the scene tree for the first time.
func _ready():
	startPath = false
	counter = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if startPath:
		$npc/CollisionShape2D/AnimatedSprite2D.animation = 'up_' + str(Global.curJob)
		$npc/CollisionShape2D/AnimatedSprite2D.play()
		set_progress(get_progress() + runSpeed * (delta - curDelta))
		$npc.global_position = $npc.global_position
	else:
		curDelta = 0
	
	if get_progress_ratio() == 1.0:
		pathComplete.emit()
	
	if leave:
		if get_progress_ratio() == 0:
			leave = false
			counter = 0
		elif $npc != null:
			print(str(get_progress_ratio()))
			counter = counter + 0.0025
			set_progress_ratio(get_progress_ratio() - counter)
			$npc.global_position = $npc.global_position



func _on_npc_timer_timeout():
	print(str('timer done'))
	startPath = true
	leave = false
	counter = 0


# when the npc is ready to leave, start moving
func _on_node_2d_leave_npc():
	set_progress_ratio(1)
	startPath = false
	leave = true
