extends Node2D

var ballNode
var enabled = true
var rare = "Common"

# Called when the node enters the scene tree for the first time.
func _ready():
	ballNode = self.get_parent().get_parent()
	ballNode.get_node("RigidBody2D").connect("body_exited", self, "_ball_hit")

func _ball_hit(body):
	var vel = ballNode.get_node("RigidBody2D").get_linear_velocity()
	
	if rare == "Common":
		ballNode.get_node("RigidBody2D").apply_central_impulse(vel*0.020)
	if rare == "Rare":
		ballNode.get_node("RigidBody2D").apply_central_impulse(vel*0.025)
	if rare == "Epic":
		ballNode.get_node("RigidBody2D").apply_central_impulse(vel*0.035)
