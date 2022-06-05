extends Node2D

var gain = 1
var time = 3
var enabled = true
var ballNode
var rare = "Common"

var floaty = preload("res://Assets/Prefabs/floatyText.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	if rare == "Common":
		time = 5
		gain = 4
	if rare == "Rare":
		time = 6
		gain = 8
	if rare == "Epic":
		time = 7
		gain = 50
	$Timer.start(time)
	ballNode = self.get_parent().get_parent()

func _on_Timer_timeout():
	if ballNode.get_node("RigidBody2D") != null:
		ballNode.get_node("RigidBody2D").add_score(gain)
		var instance = floaty.instance()
		instance.set_text("Photosynthisis +" + str(gain))
		instance.position = ballNode.get_node("RigidBody2D").position
		instance.speed = Vector2(rand_range(-50, 50), -100)
		instance.modulate = Color(rand_range(0.7,1), rand_range(0.7, 1), rand_range(0.7, 1), 1.0)
		ballNode.get_node("RigidBody2D").owner.add_child(instance)
