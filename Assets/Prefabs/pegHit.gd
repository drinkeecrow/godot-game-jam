extends Timer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var lightPeg = preload("res://Assets/Images/whiteball.png")
var darkPeg = preload("res://Assets/Images/blackBall.png")
onready var sprite = get_node("Sprite")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _init():
	sprite.texture = darkPeg
	
func _timeout():
	sprite.texture = lightPeg
