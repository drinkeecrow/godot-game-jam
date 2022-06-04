extends Node2D

var ballNode
var enabled = true
var description = "Your cell is resilient, causing it to bounce more."

# Called when the node enters the scene tree for the first time.
func _ready():
	ballNode = self.get_parent().get_parent()
	ballNode.get_node("RigidBody2D").connect("body_exited", self, "_ball_hit")

func _ball_hit(body):
	var vel = ballNode.get_node("RigidBody2D").get_linear_velocity()
	#ballNode.get_node("RigidBody2D").set_linear_velocity(vel*1.2)
	ballNode.get_node("RigidBody2D").apply_central_impulse(vel*0.025)
	
