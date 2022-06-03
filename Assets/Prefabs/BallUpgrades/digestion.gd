extends Node2D

var enabled = true
var require_hits = 20
var multiplier = 5
var hits = 0
var description = "Allows your cell to digest pegs.  After hitting " + str(require_hits) + " pegs, that peg will be digested and multiply your cells score by " + str(multiplier) + "."
onready var ballNode = self.owner


# Called when the node enters the scene tree for the first time.
func _ready():
	ballNode.get_node("RigidBody2D").connect("body_entered", self, "_ball_hit")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _ball_hit(body):
	if enabled:
		if hits >require_hits:
			body.queue_free()
			ballNode.get_node("RigidBody2D").multiply_score(multiplier)
			hits=0
		else:
			hits += 1
