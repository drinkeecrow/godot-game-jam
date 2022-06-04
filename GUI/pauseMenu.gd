extends Popup

#func _ready():
#	popup_centered()


func _on_pauseMenuOptionsButton_pressed():
	$settingsMenu.popup_centered()


func _on_pauseMenuQuitButton_pressed():
	get_tree().change_scene("res://GUI/mainMenu.tscn")
