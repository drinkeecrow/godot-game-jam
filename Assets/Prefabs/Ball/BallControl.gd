extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var state = "idle"
var score = 0
var speed = 3.0
signal released(body)


# Called when the node enters the scene tree for the first time.
func _ready():
	self.add_to_group("balls")
	self.position = get_tree().get_root().get_node("World/StartPosition").position
	gravity_scale = 0.0
	get_tree().get_root().get_node("World/TopMargin").connect("mouse_entered", self, "start_mouse_follow")
	get_tree().get_root().get_node("World/TopMargin").connect("mouse_exited", self, "end_mouse_follow")

func _exit_tree():
	get_tree().get_root().get_node("World/GameController").activeBalls -= 1
	
func _enter_tree():
	get_tree().get_root().get_node("World/GameController").activeBalls += 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _input(event):
	if event is InputEventMouseButton:
		state = "releasing"
		

func _physics_process(delta):
	if state == "idle":
		return
	var mouse = get_local_mouse_position()
	var tstep = 0.0
	tstep += delta * speed
	if state == "incubating":
		self.position = self.position.linear_interpolate(mouse + self.position, tstep)
	elif state == "releasing":
		self.set_gravity_scale(1.0)
		apply_impulse(Vector2(), Vector2(0,1))
		state = "released"
		emit_signal("released", self)
	
func add_score(num):
	score += num
	get_tree().get_root().get_node("World/Score").add_score(num)
	
func multiply_score(factor):
	get_tree().get_root().get_node("World/Score").lose_score(score)
	score = score * factor
	get_tree().get_root().get_node("World/Score").add_score(score)
	
	
func lose_score(num):
	score -= num
	get_tree().get_root().get_node("World/Score").lose_score(num)

func divide_score(div):
	get_tree().get_root().get_node("World/Score").lose_score(score)
	score = score / div
	get_tree().get_root().get_node("World/Score").add_score(score)
	
#func report_score():
#	get_tree().get_root().get_node("World/Score").add_score(score)
	
func start_mouse_follow():
	if state == "idle":
		state = "incubating"
	
func end_mouse_follow():
	if state == "incubating":
		state = "idle"
