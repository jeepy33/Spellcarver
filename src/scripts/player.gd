extends CharacterBody2D

signal touching

@export var speed = 20 # how fast player moves (pixel/sec)
var screen_size # size of game window

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	hide()


		
func get_input():
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_dir * speed

func _physics_process(delta):
	get_input()
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
		
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_v = false
		# See the note below about boolean assignment.
		$AnimatedSprite2D.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite2D.animation = "up"
		$AnimatedSprite2D.flip_v = velocity.y > 0
		
	move_and_collide(velocity * delta)



func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false




func _on_body_entered(body):
	touching.emit()
	# Must be deferred as we can't change physics properties on a physics callback.
	#$CollisionShape2D.set_deferred("disabled", true)
	if body.get_name() == "rune_table":
		print(str('touching rune table'))
