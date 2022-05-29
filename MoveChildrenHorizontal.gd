extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var hMove = 1000
var vMove = 0
var gameSpace
# Called when the node enters the scene tree for the first time.
func _ready():
	 gameSpace = self.owner
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
		for N in self.get_children():
			N.move_and_slide(Vector2(hMove,vMove)*delta)
			if N.position.x <0:
				N.position.x = gameSpace.rect_size.x
			if N.position.x >gameSpace.rect_size.x:
				N.position.x = 0
			
