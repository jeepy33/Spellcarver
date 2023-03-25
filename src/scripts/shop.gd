extends Node2D

var playerInRuneTable
var playerInCashRegister

# Called when the node enters the scene tree for the first time.
func _ready():
	$rune_table/highlight.hide()
	$cash_register/highlight.hide()
	$player.start($player_start.position)
	playerInRuneTable = false
	playerInCashRegister = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("select_object"):
		if playerInRuneTable:
			print(str("player selected rune"))
		if playerInCashRegister:
			print(str("player selected cash register"))


func _on_area_2d_body_entered(body):
	if body.get_name() == "player":
		$rune_table/highlight.show()
		playerInRuneTable = true

func _on_area_2d_body_exited(body):
	$rune_table/highlight.hide()
	playerInRuneTable = false

func _on_register_body_entered(body):
	if body.get_name() == "player":
		$cash_register/highlight.show()
		playerInCashRegister = true

func _on_register_body_exited(body):
	$cash_register/highlight.hide()
	playerInCashRegister = false
