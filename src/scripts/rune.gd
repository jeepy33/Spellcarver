extends Node

var zero = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
var one = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
var two = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
var three = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]

# primordial runes
var fire = [0,1,0,0,1,0,1,1,0,0,0,1,0,0,1,0,0,0,0,0,0]
var water = [1,0,1,0,0,0,0,1,0,0,0,0,1,1,0,0,0,0,1,1,0]
var air = [0,1,1,0,0,0,0,1,1,0,0,1,0,0,1,1,1,1,0,1,0]
var earth = [0,0,1,1,1,0,0,1,0,0,1,1,1,0,0,1,0,0,1,1,1]

# control runes
var low_potency = [0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,1,0,1,1,1,1]
var high_potency = [0,0,1,1,1,1,0,1,0,0,0,1,1,1,0,1,0,0,1,1,1]
var low_duration = [0,0,0,0,0,0,1,0,1,0,0,1,0,0,1,1,1,0,1,0,0]
var high_duration = [1,1,1,0,0,0,1,1,1,0,0,1,0,0,0,1,0,0,0,0,0]

# arcane runes
var light = [0,1,1,0,1,0,0,1,1,1,0,1,1,0,0,1,1,0,1,1,0]
var shadow = [0,0,1,0,1,1,0,1,1,0,0,1,1,1,0,1,1,0,1,1,1]
var time = [0,0,1,1,0,0,0,1,0,0,1,1,0,0,0,1,0,1,1,0,0]
var space = [1,0,1,0,0,0,1,1,0,0,0,1,0,0,1,1,0,0,1,0,0]

# form runes
var gas = [0,1,0,0,0,1,1,0,1,0,0,1,0,0,1,0,0,0,0,0,0]
var liquid = [0,1,0,0,1,1,1,0,1,0,1,1,0,0,1,1,0,0,0,0,0]
var solid = [0,1,0,1,1,1,1,0,1,0,1,1,1,0,1,1,0,1,1,0,0]
var formless = [1,1,0,0,0,0,1,0,1,0,0,0,0,0,1,0,1,0,0,0,0]

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
	if(zero == fire):
		runes.append("Fire")
	elif(zero == water):
		runes.append("Water")
	elif(zero == air):
		runes.append("Air")
	elif(zero == earth):
		runes.append("Earth")
	else:
		if (arr_sum(zero) != 0):
			runes = []
			return
	if(one == low_potency):
		runes.append("Low Potency")
	elif(one == high_potency):
		runes.append("High Potency")
	elif(one == low_duration):
		runes.append("Low Duration")
	elif(one == high_duration):
		runes.append("High Duration")
	else:
		if (arr_sum(one) != 0):
			runes = []
			return
	if(two == light):
		runes.append("Light")
	elif(two == shadow):
		runes.append("Shadow")
	elif(two == time):
		runes.append("Time")
	elif(two == space):
		runes.append("Space")
	else:
		if (arr_sum(two) != 0):
			runes = []
			return
	if(three == gas):
		runes.append("Gas")
	elif(three == liquid):
		runes.append("Liquid")
	elif(three == solid):
		runes.append("Solid")
	elif(three == formless):
		runes.append("Formless")
	else:
		if (arr_sum(three) != 0):
			runes = []
			return
			
@onready var rune_carved = $Runes
@onready var text = $Label
@onready var quad_zero = $rune_guide/quadrant_zero
@onready var quad_one = $rune_guide/quadrant_one
@onready var quad_two = $rune_guide/quadrant_two
@onready var quad_three = $rune_guide/quadrant_three




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
	check_runes()
	rune_carved.text = arr_to_string(runes)

