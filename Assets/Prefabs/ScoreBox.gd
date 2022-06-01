extends Area2D

var multi = 1
var ball = preload("res://Assets/Prefabs/Ballmeba.tscn")
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
		if body.get_parent().get_node("Upgrades").get_node("Survival") != null and body.get_parent().get_node("Upgrades").get_node("Survival").enabled:
				get_tree().get_root().get_node("World/Score").multiply_score(multi)
				var instance = ball.instance()
				instance.get_node("Upgrades").get_node("Survival").enabled=false
				get_tree().get_root().get_node("World").add_child(instance)
				body.queue_free()
		else:
			get_tree().get_root().get_node("World/Score").multiply_score(multi)
			body.queue_free()


func _on_BotWall2_body_entered(body):
	pass # Replace with function body.
