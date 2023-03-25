extends Node2D

var playerInRuneTable
var playerInCashRegister
var playerInSaveStation
var playerInShopDoor
var taskAvailable

var shopOpen

# Called when the node enters the scene tree for the first time.
func _ready():
	$rune_table/highlight.hide()
	$cash_register/highlight.hide()
	$save_station/highlight.hide()
	$shop_door/highlight.hide()
	$NPCPath/NPCPathFollow/npc/CollisionShape2D/highlight.hide()
	
	$NPCPath.hide()
	$NPCPath/NPCPathFollow/npc/CollisionShape2D.disabled = true
	
	$player.start($player_start.position)
	
	playerInRuneTable = false
	playerInCashRegister = false
	playerInSaveStation = false
	playerInShopDoor = false
	
	shopOpen = false
	
	taskAvailable = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("select_object"):
		if playerInRuneTable:
			print(str("player selected rune"))
		if playerInCashRegister:
			print(str("player selected cash register"))
		if playerInSaveStation:
			print(str("player selected save station"))
			$save_station/ConfirmationDialog.visible = true
		if playerInShopDoor:
			print(str("player selected shop door"))
			shopOpen = not shopOpen
		if taskAvailable:
			print(str("player selected task"))
	
	if shopOpen:
		print(str("start timer"))
		$NPCTimer.start()
		shopOpen = not shopOpen



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

func _on_save_body_entered(body):
	if body.get_name() == "player":
		$save_station/highlight.show()
		playerInSaveStation = true
	
func _on_save_body_exited(body):
	$save_station/highlight.hide()
	playerInSaveStation = false

func _on_door_body_entered(body):
	if body.get_name() == "player":
		$shop_door/highlight.show()
		playerInShopDoor = true

func _on_door_body_exited(body):
	$shop_door/highlight.hide()
	playerInShopDoor = false


func _on_npc_timer_timeout():
	$NPCPath.show()
	$NPCPath/NPCPathFollow/npc/CollisionShape2D.disabled = false
	$NPCTimer.paused = true # maybe race condition (probably not?)

func _on_npc_player_enter():
	$NPCPath/NPCPathFollow/npc/CollisionShape2D/highlight.show()
	taskAvailable = true

func _on_npc_player_leave():
	$NPCPath/NPCPathFollow/npc/CollisionShape2D/highlight.hide()
	taskAvailable = false
