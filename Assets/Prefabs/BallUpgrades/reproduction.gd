extends Node2D


var ballRes = preload("res://Assets/Prefabs/Ball/Ballmeba.tscn")
var ballNode
var hits = 0
var required_hits = 15
var enabled = true
var rare = "Common"

# Called when the node enters the scene tree for the first time.
	
func _ready():
	ballNode = self.get_parent().get_parent()
	ballNode.get_node("RigidBody2D").connect("body_entered", self, "_ball_hit")

func _ball_hit(body):
	if enabled:
		if rare == "Common":
			required_hits = 15
		if rare == "Rare":
			required_hits = 10
		if rare == "Epic":
			required_hits = 7
		if hits >required_hits:
			var instance = ballRes.instance()
			for u in ballNode.get_node("Upgrades").get_children():
				var copy = u.duplicate()
				copy.rare = u.rare
				instance.get_node("Upgrades").add_child(copy)
			
			if instance.get_node("Upgrades").get_node("Survival") != null:
				instance.get_node("Upgrades").get_node("Survival").enabled = false
			if instance.get_node("Upgrades").get_node("Reproduction") != null:
				instance.get_node("Upgrades").get_node("Reproduction").enabled = false
			
			get_tree().get_root().get_node("World").add_child(instance)
			hits=0
		else:
			hits += 1
