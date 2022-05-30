extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	#$Hrow1.hMove = 1000
	#$Hrow2.hMove = -500
	#$Hrow3.hMove = -500
	#$Hrow4.hMove = 1000
	$Crow1.speed = 1.5
	$Vrow1.vMove = 1000
	$Vrow2.vMove = -1000
	$Vrow3.vMove = 1000
	$Vrow4.vMove = -1000
	#$Crow2.speed = -0.5
	#$Crow3.speed = -0.5
	#$Crow4.speed = 1.5

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
