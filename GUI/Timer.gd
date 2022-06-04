extends Timer


func _on_Timer_timeout():
	self.get_parent().apply_central_impulse(Vector2(-100,100))
	print("ping")
