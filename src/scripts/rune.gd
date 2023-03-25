extends Node

var zero = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
var one = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
var two = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
var three = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]

# primordial runes
var fire = []
var water = []
var air = []
var earth = []

# control runes
var low_potency = []
var high_potency = []
var low_duration = []
var high_duration = []

# arcane runes
var light = []
var shadow = []
var time = []
var space = []

# form runes
var gas = []
var liquid = []
var solid = []
var formless = []

@onready var text = $Label
@onready var quad_zero = $rune_guide/quadrant_zero
@onready var quad_one = $rune_guide/quadrant_one
@onready var quad_two = $rune_guide/quadrant_two
@onready var quad_three = $rune_guide/quadrant_three

# Called when the node enters the scene tree for the first time.
func _ready():
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

func _on_Button0_toggled(which : Button):
	zero[int(which.name.dedent())] = int(which.button_pressed)
func _on_Button1_toggled(which : Button):
	one[int(which.name.dedent())] = int(which.button_pressed)
func _on_Button2_toggled(which : Button):
	two[int(which.name.dedent())] = int(which.button_pressed)
func _on_Button3_toggled(which : Button):
	three[int(which.name.dedent())] = int(which.button_pressed)

func arr_to_string(arr: Array) -> String:
	var s = ""
	for i in arr:
		s += str(i)
	return s


func _on_carve_rune_pressed():
	pass
