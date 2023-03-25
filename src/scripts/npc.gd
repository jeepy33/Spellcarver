extends RigidBody2D

signal playerEnter
signal playerLeave

# Called when the node enters the scene tree for the first time.
func _ready():
	$CollisionShape2D/AnimatedSprite2D.animation = 'up_' + str(Global.curJob)
	$CollisionShape2D/AnimatedSprite2D.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_npc_path_follow_path_complete():
	$CollisionShape2D/AnimatedSprite2D.stop()



func _on_area_2d_body_entered(body):
	if body.get_name() == 'player':
		playerEnter.emit()

func _on_area_2d_body_exited(body):
	print(str('want to leave'))
	playerLeave.emit()
	

func _on_node_2d_leave_npc():
	var spriteNum = Global.curJob
	if Global.usePrevSprite:
		spriteNum -= 1
		Global.usePrevSprite = false
	$CollisionShape2D/AnimatedSprite2D.animation = 'down_' + str(spriteNum)
	$CollisionShape2D/AnimatedSprite2D.play()
