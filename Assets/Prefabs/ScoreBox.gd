extends Area2D

var multi = 1
var ball = preload("res://Assets/Prefabs/Ball/Ballmeba.tscn")
var rare = "Common"

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
			body.multiply_score(multi)
			#body.report_score()
			var max_deaths = 1
			if rare == "Common":
				max_deaths = 1
			if rare == "Rare":
				max_deaths = 2
			if rare == "Epic":
				max_deaths = 3
			if body.get_parent().get_node("Upgrades").get_node("Survival").deaths < max_deaths:
				var instance = ball.instance()
				for u in body.get_parent().get_node("Upgrades").get_children():
					var copy = u.duplicate()
					instance.get_node("Upgrades").add_child(copy)
				instance.get_node("Upgrades").get_node("Survival").deaths += 1
				get_tree().get_root().get_node("World").add_child(instance)
			body.get_parent().queue_free()
		else:
			get_tree().get_root().get_node("World/Score").multiply_score(multi)
			body.multiply_score(multi)
			#body.report_score()
			body.get_parent().queue_free()
		if get_tree().get_root().get_node("World/GameController").activeBalls == 1:
			get_tree().get_root().get_node("World/GameController").skill_selection()

