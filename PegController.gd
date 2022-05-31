extends Container


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var lvl1 = preload("res://Assets/Prefabs/lvl1.tscn")
var lvl2 = preload("res://Assets/Prefabs/lvl2.tscn")
var ball = preload("res://Assets/Prefabs/Ballmeba.tscn")
var pegsName = "Pegs"
var ballName = "Ballmeba"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
#	print(str(self.rect_size.x) + " - " + str(self.rect_size.y))
#
#	var xspace = self.rect_size.x/11
#	var yspace = self.rect_size.y/6
#
#	for m in 6:
#		for n in 11:
#			var instance = pegFab.instance()
#			instance.position.x=n*xspace+m%2*(xspace/2)+5
#			instance.position.y=yspace*m
#			add_child(instance)
			

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_GameSpace_gui_input(_event):
	pass
#	if event is InputEventMouseButton and event.is_pressed():
#		var ball = get_node("Ballmeba/RigidBody2D")
#		ball.apply_central_impulse(ball.get_parent().position.direction_to(event.position)*100)
#		print(str(event.position.x) + ' ' + str(event.position.y))


func _on_Button_pressed():
	get_node(pegsName).queue_free()
	self.get_parent().get_node(ballName).queue_free()
	var instance = lvl1.instance()
	self.add_child((instance))
	pegsName = instance.name
	var binstance = ball.instance()
	self.get_parent().add_child(binstance)
	ballName = binstance.name
	


func _on_Button2_pressed():
	get_node(pegsName).queue_free()
	self.get_parent().get_node(ballName).queue_free()
	var instance = lvl2.instance()
	self.add_child((instance))
	pegsName = instance.name
	var binstance = ball.instance()
	self.get_parent().add_child(binstance)
	ballName = binstance.name
