extends Node2D


var ballRes = load("res://Assets/Prefabs/Ballmeba.tscn")
onready var ballNode = self.owner
var hits = 0
var enabled = true

# Called when the node enters the scene tree for the first time.
func _ready():
	ballNode.get_node("RigidBody2D").connect("body_entered", self, "_ball_hit")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _ball_hit(body):
	if enabled:
		if hits >15:
			var instance = ballRes.instance()
			#This disables reproduction on the children.  You can take this out but it gets out of hand fast
			instance.get_node("Upgrades").get_node("Reproduction").enabled = false
			
#			----Code to delete all upgrades in new ball, if you want it			
#			for n in instance.get_node("Upgrades").get_children():
#				instance.get_node("Upgrades").remove_child(n)
#				n.queue_free()

			get_tree().get_root().get_node("World/TopMargin").add_child(instance)
			hits=0
		else:
			hits += 1
