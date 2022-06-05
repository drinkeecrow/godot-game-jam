extends Node2D


func _process(delta):
	if $pauseMenu.visible == false:
		if Input.is_action_pressed("ui_cancel"):
			get_tree().paused = true
			$pauseMenu.popup_centered()
			$pauseMenu.set_global_position(Vector2(-640, -360))

func _on_pauseMenu_popup_hide():
	get_tree().paused=false
