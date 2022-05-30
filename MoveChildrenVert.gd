extends Node2D


var hMove = 0
var vMove = 1000

# Called when the node enters the scene tree for the first time.
func _ready():
	 pass
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
		for N in self.get_children():
			if N is KinematicBody2D:
				N.move_and_slide(Vector2(hMove,vMove)*delta)
				if N.position.y <$Top.position.y:
					N.position.y = $Bot.position.y
				if N.position.y >$Bot.position.y:
					N.position.y = $Top.position.y
