extends RigidBody2D

signal playerEnter
signal playerLeave

# Called when the node enters the scene tree for the first time.
func _ready():
	$CollisionShape2D/AnimatedSprite2D.animation = 'up'
	$CollisionShape2D/AnimatedSprite2D.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# delete object when it leaves the screen
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_npc_path_follow_path_complete():
	$CollisionShape2D/AnimatedSprite2D.stop()



func _on_area_2d_body_entered(body):
	if body.get_name() == 'player':
		playerEnter.emit()

func _on_area_2d_body_exited(body):
	playerLeave.emit()
