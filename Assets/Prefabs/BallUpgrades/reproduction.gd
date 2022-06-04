extends Node2D


var ballRes = preload("res://Assets/Prefabs/Ball/Ballmeba.tscn")
var ballNode
var hits = 0
var required_hits = 15
var enabled = true
var description = "Allows your cell to reproduce.  Every " + str(required_hits) + " hits will provide an offspring.  Offspring carry all traits of their parent, except the ability to reproduce."

# Called when the node enters the scene tree for the first time.
	
func _ready():
	ballNode = self.get_parent().get_parent()
	ballNode.get_node("RigidBody2D").connect("body_entered", self, "_ball_hit")

func _ball_hit(body):
	if enabled:
		if hits >required_hits:
			var instance = ballRes.instance()
			get_tree().get_root().get_node("World").add_child(instance)
			hits=0
		else:
			hits += 1
