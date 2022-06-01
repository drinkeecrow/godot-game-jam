extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var state = "idle"
var score = 0
var speed = 3.0


# Called when the node enters the scene tree for the first time.
func _ready():
	self.add_to_group("balls")
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
	tstep += delta * speed
	if state == "incubating":
		gravity_scale = 0.0
		self.position = self.position.linear_interpolate(mouse + self.position, tstep)
	elif state == "released":
		gravity_scale = 1.0
		apply_impulse(Vector2(), Vector2(0,1))
	
func add_score(num):
	score += num
	
func multiply_score(factor):
	score = score * factor
	
func lose_score(num):
	score -= num

func divide_score(div):
	score = score / div
	
func report_score():
	get_tree().get_root().get_node("World/Score").add_score(score)
