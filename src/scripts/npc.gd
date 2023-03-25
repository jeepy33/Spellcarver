extends RigidBody2D


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
