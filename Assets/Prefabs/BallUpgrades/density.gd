extends Node2D

var ballNode
var enabled = true
var rare = "Common"

# Called when the node enters the scene tree for the first time.
func _ready():
	ballNode = self.get_parent().get_parent()
	ballNode.get_node("RigidBody2D").connect("released", self, "on_released")
	

func on_released(body):
	if rare == "Common":
		body.set_gravity_scale(5)
	if rare == "Rare":
		body.set_gravity_scale(10)
	if rare == "Epic":
		body.set_gravity_scale(20)
