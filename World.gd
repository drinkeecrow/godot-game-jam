extends Node2D


func _process(delta):
	if Input.is_action_pressed("ui_cancel"):	
		get_tree().paused = true
		$pauseMenu.popup().rect_global_position = 

func _on_pauseMenu_popup_hide():
	get_tree().paused = false
