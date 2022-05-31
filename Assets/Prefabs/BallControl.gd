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
	pass
	
func _input(event):
	if event is InputEventMouseButton:
		state = "released"
		

func _physics_process(delta):
	var mouse = get_local_mouse_position()
	var tstep = 0.0
	tstep += delta * 2.0
	if state == "incubating":
		gravity_scale = 0.0
		self.position = self.position.linear_interpolate(mouse + self.position, tstep)
	elif state == "released":
		gravity_scale = 1.0
		apply_impulse(Vector2(), Vector2(0,1))
	
