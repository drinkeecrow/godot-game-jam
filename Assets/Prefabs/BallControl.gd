extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var state = "idle"
var score = 0
var speed = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	state = "incubating"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if delta / 5 == 0:
		print(state)
	pass
	
func _input(event):
	if event is InputEventMouseButton:
		state = "released"
		

func _physics_process(delta):
	var mouse = get_local_mouse_position()
	if state == "incubating":
		#applied_force = mouse - get_global_position()
		translate(mouse)
	else:
		applied_force = Vector2()
