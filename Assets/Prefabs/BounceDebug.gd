extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var ball = preload("res://Assets/Prefabs/Ballmeba.tscn")
var floaty = preload("res://Assets/Prefabs/floatyText.tscn")
var canSpawn = true
export var hMove = 0;
export var vMove = 1000;
var hits = 0
var hit = false
onready var gameSpace = get_tree().get_root().get_node(("World/GameSpace"))

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	

func _physics_process(delta):
	pass

func _on_Area2D_body_entered(body):
	if not body == self:
		print("Boing")
		var instance = floaty.instance()
		hits += 1
		instance.set_text("+" + str(hits))
		instance.position = Vector2(0,0)
		instance.speed = Vector2(rand_range(-50, 50), -100)
		instance.modulate = Color(rand_range(0.7,1), rand_range(0.7, 1), rand_range(0.7, 1), 1.0)
		self.add_child(instance)
		var red = self.get_node("Sprite").get_modulate().r
		self.get_node("Sprite").modulate = Color(red+0.2,1,1)
		self.get_tree().get_root().get_node("World").get_node("Score").add_score(hits)
		
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

