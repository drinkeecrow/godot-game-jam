extends Popup

#func _ready():
#	popup_centered()


func _on_pauseMenuOptionsButton_pressed():
	$settingsMenu.popup_centered()
	$settingsMenu.set_global_position(Vector2(-480,-270))


func _on_pauseMenuQuitButton_pressed():
	get_tree().change_scene("res://GUI/mainMenu.tscn")


func _on_pauseMenuReturnButton_pressed():
	hide()
