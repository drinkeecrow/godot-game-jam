extends Node2D

func _process(delta):
	if Input.is_action_pressed("ui_cancel"):
		$pauseMenu.popup_exclusive(-500, 400)
