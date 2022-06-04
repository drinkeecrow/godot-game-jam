extends RigidBody2D

var hitSound1 = preload("res://Assets/fruit1.wav")
var hitSound2 = preload("res://Assets/fruit2.wav")
var hitSound3 = preload("res://Assets/fruit3.wav")
func _ready():
	self.apply_central_impulse(Vector2(150,0))
	

func _on_Ball_body_entered(body):
	#if not $AudioStreamPlayer2D.is_playing():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var rndSound = rng.randi_range(1,3)
	if rndSound == 1:
		$AudioStreamPlayer2D.stream = hitSound1
	if rndSound == 2:
		$AudioStreamPlayer2D.stream = hitSound2
	if rndSound == 3:
		$AudioStreamPlayer2D.stream = hitSound3
	$AudioStreamPlayer2D.play()
