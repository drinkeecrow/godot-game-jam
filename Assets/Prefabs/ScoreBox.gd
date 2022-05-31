extends Area2D

var multi = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	multi = rng.randi_range(1,4)
	$Label.text = "X" + str(multi)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_ScoreBox1_body_entered(body):
	if body is RigidBody2D:
		print("Multi " + body.name + " " + str(multi))
		get_tree().get_root().get_node("World/Score").multiply_score(multi)
		body.queue_free()


func _on_BotWall2_body_entered(body):
	pass # Replace with function body.
