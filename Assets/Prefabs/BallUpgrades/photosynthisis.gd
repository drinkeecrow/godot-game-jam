extends Node2D

var gain = 1
var time = 3
var enabled = true
var description
onready var ballNode = self.owner
var floaty = preload("res://Assets/Prefabs/floatyText.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	description = "Your cell is fed from the sun.  It gains " + str(gain) + " every " + str(time) + " seconds."
	$Timer.start(time)

func _on_Timer_timeout():
	if ballNode.get_node("RigidBody2D") != null:
		ballNode.get_node("RigidBody2D").add_score(gain)
		var instance = floaty.instance()
		instance.set_text("Photosynthisis +" + str(gain))
		instance.position = ballNode.get_node("RigidBody2D").position
		instance.speed = Vector2(rand_range(-50, 50), -100)
		instance.modulate = Color(rand_range(0.7,1), rand_range(0.7, 1), rand_range(0.7, 1), 1.0)
		ballNode.get_node("RigidBody2D").owner.add_child(instance)
