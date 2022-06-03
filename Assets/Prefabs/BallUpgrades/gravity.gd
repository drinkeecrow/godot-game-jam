extends Node2D

onready var ballNode = self.owner
var enabled = true

# Called when the node enters the scene tree for the first time.
func _ready():
	ballNode.get_node("RigidBody2D").connect("released", self, "on_released")
	

func on_released(body):
	body.set_gravity_scale(.5)
