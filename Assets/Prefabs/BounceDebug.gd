extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var ball = preload("res://Assets/Prefabs/Ballmeba.tscn")
var floaty = preload("res://Assets/Prefabs/floatyText.tscn")
var canSpawn = true
var hMove = 0;
var vMove = 1000;
onready var gameSpace = get_tree().get_root().get_node(("World/GameSpace"))

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	

#func _physics_process(delta):
#	move_and_slide(Vector2(hMove,vMove)*delta)
#	if self.position.x <0:
#		self.position.x = gameSpace.rect_size.x
#	if self.position.x >gameSpace.rect_size.x:
#		self.position.x = 0
#	if self.position.y <0:
#		self.position.y = 515
#	if self.position.y > 515:
#		self.position.y = 0	

func _on_Area2D_body_entered(body):
	if not body == self:
		print("Boing")
		var red = self.get_node("Sprite").get_modulate().r
		self.get_node("Sprite").modulate = Color(red+0.2,1,1)
		
#		if self.canSpawn:
#			var instance = ball.instance()
#			#instance.position.x = body.get_parent().position.x +30
#			#instance.position.y = body.get_parent().position.y +30
#			instance.position.x = self.position.x+30
#			instance.position.y = self.position.y+30
#			instance.name='ball'
#			self.get_parent().add_child(instance)
#			print(body.get_parent().get_name() + ' ' + str(body.get_parent().position.x) + ' ' + str(body.get_parent().position.y))
#			self.canSpawn = false

