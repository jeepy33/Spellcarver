extends Node

var zero = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
var one = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
var two = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
var three = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]



var tome_page = 2

var runes = []

func combine_runes(rune1, rune2):
	var result = []
	var i = 0
	for num in rune1:
		result.append(int(num or rune2[i]))
		i += 1
	return result

func check_runes():
	runes = []
	var r = [Global.blank]
	if(zero == Global.fire):
		runes.append("Fire")
		r.append(Global.fire)
	elif(zero == Global.water):
		runes.append("Water")
		r.append(Global.water)
	elif(zero == Global.air):
		runes.append("Air")
		r.append(Global.air)
	elif(zero == Global.earth):
		runes.append("Earth")
		r.append(Global.earth)
	else:
		if (arr_sum(zero) != 0):
			runes = []
			return [Global.blank]
	if(one == Global.low_potency):
		runes.append("Low Potency")
		r.append(Global.low_potency)
	elif(one == Global.high_potency):
		runes.append("High Potency")
		r.append(Global.high_potency)
	elif(one == Global.low_duration):
		runes.append("Low Duration")
		r.append(Global.low_duration)
	elif(one == Global.high_duration):
		runes.append("High Duration")
		r.append(Global.high_duration)
	else:
		if (arr_sum(one) != 0):
			runes = []
			return [Global.blank]
	if(two == Global.light):
		runes.append("Light")
		r.append(Global.light)
	elif(two == Global.shadow):
		runes.append("Shadow")
		r.append(Global.shadow)
	elif(two == Global.time):
		runes.append("Time")
		r.append(Global.time)
	elif(two == Global.space):
		runes.append("Space")
		r.append(Global.space)
	else:
		if (arr_sum(two) != 0):
			runes = []
			return [Global.blank]
	if(three == Global.gas):
		runes.append("Gas")
		r.append(Global.gas)
	elif(three == Global.liquid):
		runes.append("Liquid")
		r.append(Global.liquid)
	elif(three == Global.solid):
		runes.append("Solid")
		r.append(Global.solid)
	elif(three == Global.formless):
		runes.append("Formless")
		r.append(Global.formless)
	else:
		if (arr_sum(three) != 0):
			runes = []
			return [Global.blank]
	return r
			
@onready var rune_carved = $Runes
@onready var text = $Label
@onready var guide = $rune_guide
@onready var quad_zero = $rune_guide/quadrant_zero
@onready var quad_one = $rune_guide/quadrant_one
@onready var quad_two = $rune_guide/quadrant_two
@onready var quad_three = $rune_guide/quadrant_three
@onready var tome_button = $journal
@onready var tome_open = $TomeOpen
@onready var next = $TomeOpen/next
@onready var prev = $TomeOpen/prev
@onready var left_rune = $TomeOpen/left_rune
@onready var right_rune = $TomeOpen/right_rune
@onready var rune_result = $rune_result




# Called when the node enters the scene tree for the first time.
func _ready():
	print_debug("Ready")
	for b in quad_zero.get_children():
		b.pressed.connect(self._on_Button0_toggled.bind(b))
	for b in quad_one.get_children():
		b.pressed.connect(self._on_Button1_toggled.bind(b))
	for b in quad_two.get_children():
		b.pressed.connect(self._on_Button2_toggled.bind(b))
	for b in quad_three.get_children():
		b.pressed.connect(self._on_Button3_toggled.bind(b))
	
	guide.rotate(deg_to_rad(-90*Global.master_quadrant))
	_set_result_runes(check_runes())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text.text = "0: " + arr_to_string(zero) + "\n1: " + arr_to_string(one) + "\n2: " + arr_to_string(two) + "\n3: " + arr_to_string(three)

func _on_Button0_toggled(which : TextureButton):
	#print_debug(int(which.button_pressed))
	zero[int(which.name.dedent())] = int(which.button_pressed)
func _on_Button1_toggled(which : TextureButton):
	#print_debug(int(which.button_pressed))
	one[int(which.name.dedent())] = int(which.button_pressed)
func _on_Button2_toggled(which : TextureButton):
	#print_debug(int(which.button_pressed))
	two[int(which.name.dedent())] = int(which.button_pressed)
func _on_Button3_toggled(which : TextureButton):
	#print_debug(int(which.button_pressed))
	three[int(which.name.dedent())] = int(which.button_pressed)

func arr_to_string(arr: Array) -> String:
	var s = ""
	for i in arr:
		s += str(i) + ", "
	return s
	
func arr_sum(arr: Array) -> int:
	var s = 0
	for i in arr:
		s += i
	return s


func _on_carve_rune_pressed():
	_set_result_runes(check_runes())
	var strBld = ""
	if (runes.is_empty()):
		rune_carved.dialog_text = "Unable to carve a rune..."
		rune_carved.get_ok_button().disabled = true
	else:
		strBld += "Successfully Carved a Rune of " + runes[0]
		if (runes.size() > 1):
			for s in runes:
				strBld += " and " + s
		rune_carved.dialog_text = strBld
		rune_carved.get_ok_button().disabled = false
	rune_carved.visible = true
		
	



func _on_reset_pressed():
	for b in quad_zero.get_children():
		b.button_pressed = false
	for b in quad_one.get_children():
		b.button_pressed = false
	for b in quad_two.get_children():
		b.button_pressed = false
	for b in quad_three.get_children():
		b.button_pressed = false
	zero = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
	one = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
	two = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
	three = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
	_set_result_runes(check_runes())


func _on_journal_pressed():
	tome_button.visible = false;
	tome_open.visible = true;
	_set_tome_runes(Global.tome_contents[tome_page-2],Global.tome_contents[tome_page-1])


func _on_close_pressed():
	tome_button.visible = true;
	tome_open.visible = false;


func _on_next_pressed():
	if (tome_page < Global.tome_pages):
		tome_page += 2
		_set_tome_runes(Global.tome_contents[tome_page-2],Global.tome_contents[tome_page-1])
		if (!prev.visible):
			prev.visible = true;
		if (tome_page >= Global.tome_pages):
			next.visible = false;

func _on_prev_pressed():
	if (tome_page > 2):
		tome_page -= 2
		_set_tome_runes(Global.tome_contents[tome_page-2],Global.tome_contents[tome_page-1])
		if (!next.visible):
			next.visible = true;
		if (tome_page <= 2):
			prev.visible = false
		
func _set_tome_runes(left, right):
	if (arr_sum(left) == 0):
		left_rune.visible = false
	else:
		left_rune.visible = true
	if (arr_sum(right) == 0):
		right_rune.visible = false
	else:
		right_rune.visible = true
	
	var leftQ = 0
	var rightQ = 0
	if (Global.primordial.find(left,0) >= 0):
		leftQ = (0 + 4-Global.master_quadrant)%4
	elif (Global.control.find(left,0) >= 0):
		leftQ = (1 + 4-Global.master_quadrant)%4
	elif (Global.arcane.find(left,0) >= 0):
		leftQ = (2 + 4-Global.master_quadrant)%4
	elif (Global.form.find(left,0) >= 0):
		leftQ = (3 + 4-Global.master_quadrant)%4
	
	if (Global.primordial.find(right,0) >= 0):
		rightQ = (0 + 4-Global.master_quadrant)%4
	elif (Global.control.find(right,0) >= 0):
		rightQ = (1 + 4-Global.master_quadrant)%4
	elif (Global.arcane.find(right,0) >= 0):
		rightQ = (2 + 4-Global.master_quadrant)%4
	elif (Global.form.find(right,0) >= 0):
		rightQ = (3 + 4-Global.master_quadrant)%4
	
	for q in left_rune.get_children():
		for b in q.get_children():
			if(left[int(b.name.dedent())] == 1 && (q == left_rune.get_child(leftQ) || left == Global.full)):
				b.visible = true;
			else:
				b.visible = false;
				
	for q in right_rune.get_children():
		for b in q.get_children():
			if(right[int(b.name.dedent())] == 1 && (q == right_rune.get_child(rightQ)|| right == Global.full)):
				b.visible = true;
			else:
				b.visible = false;
				
func _set_result_runes(r):
	for left in r:
		if (arr_sum(left) == 0):
			rune_result.visible = false
		else:
			rune_result.visible = true
		
		var leftQ = 0
		if (Global.primordial.find(left,0) >= 0):
			leftQ = (0 + 4-Global.master_quadrant)%4
		elif (Global.control.find(left,0) >= 0):
			leftQ = (1 + 4-Global.master_quadrant)%4
		elif (Global.arcane.find(left,0) >= 0):
			leftQ = (2 + 4-Global.master_quadrant)%4
		elif (Global.form.find(left,0) >= 0):
			leftQ = (3 + 4-Global.master_quadrant)%4
		
		for q in rune_result.get_children():
			for b in q.get_children():
				if(left[int(b.name.dedent())] == 1 && (q == rune_result.get_child(leftQ) || left == Global.full)):
					b.visible = true;
				else:
					b.visible = false;


func _on_runes_confirmed():
	pass # Replace with function body.


func _on_exit_pressed():
	get_tree().change_scene_to_file("res://src/scenes/shop.tscn")
