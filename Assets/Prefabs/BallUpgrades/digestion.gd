extends Node2D

var enabled = true
var require_hits = 5
var multiplier = 5
var hits = 0
var description = "Allows your cell to digest pegs.  After hitting " + str(require_hits) + " pegs, that peg will be digested and multiply your cells score by " + str(multiplier) + "."
onready var ballNode = self.owner
var floaty = preload("res://Assets/Prefabs/floatyText.tscn")
var belch1 = preload("res://Assets/belch1.wav")
var belch2 = preload("res://Assets/belch2.wav")
var belch3 = preload("res://Assets/belch3.wav")
var belch4 = preload("res://Assets/belch4.wav")
var belch5 = preload("res://Assets/belch5.wav")
var belch6 = preload("res://Assets/belch6.wav")

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
			var instance = floaty.instance()
			instance.set_text("*BELCH*")
			instance.position = ballNode.get_node("RigidBody2D").position
			instance.speed = Vector2(rand_range(-50, 50), -100)
			instance.modulate = Color(rand_range(0.7,1), rand_range(0.7, 1), rand_range(0.7, 1), 1.0)
			ballNode.get_node("RigidBody2D").owner.add_child(instance)
			
			var rng = RandomNumberGenerator.new()
			rng.randomize()
			var rndSound = rng.randi_range(1,6)
			if rndSound == 1:
				$AudioStreamPlayer2D.stream = belch1
			if rndSound == 2:
				$AudioStreamPlayer2D.stream = belch2
			if rndSound == 3:
				$AudioStreamPlayer2D.stream = belch3
			if rndSound == 4:
				$AudioStreamPlayer2D.stream = belch4
			if rndSound == 5:
				$AudioStreamPlayer2D.stream = belch5
			if rndSound == 6:
				$AudioStreamPlayer2D.stream = belch6
			$AudioStreamPlayer2D.play()
		else:
			hits += 1
