extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var hMove = 1000
var vMove = 0
var gameSpace
# Called when the node enters the scene tree for the first time.
func _ready():
	 gameSpace = self.owner.owner
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
		for N in self.get_children():
			if N is KinematicBody2D:
				N.move_and_slide(Vector2(hMove,vMove)*delta)
				if N.position.x <$Left.position.x:
					N.position.x = $Right.position.x
				if N.position.x >$Right.position.x:
					N.position.x = $Left.position.x
			
