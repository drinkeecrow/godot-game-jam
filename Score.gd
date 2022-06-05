extends Label

var score = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	self.text = str(score)

func get_score():
	return score
	
func add_score(num):
	score += num
	self.text = str(score)
	
func multiply_score(factor):
	score = score * factor
	self.text = str(score)

func lose_score(num):
	score -= num
	self.text = str(score)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
