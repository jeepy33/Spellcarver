extends Node

var curJob = 0

# set in talkscene, NPCPathFollow, used in npc
var acceptedJob = false
var tome_pages = 4

var master_quadrant = 0

var blank = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
var full = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
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

var primordial = [fire,water,air,earth]
var control = [low_potency,high_potency,low_duration,high_duration]
var arcane = [light,shadow,time,space]
var form = [gas,liquid,solid,formless]
#                                     blank                                          fire                                   low potency                    
var tome_contents = [full,fire,low_potency,water]


var taskDone = false

var usePrevSprite = false

var curRune = "Fire"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
