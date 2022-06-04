extends Control

func _ready():
	pass

func _on_startButton_pressed():
	get_tree().change_scene("res://World.tscn")

func _on_optionsButton_pressed():
	$settingsMenu.popup_centered()

func _on_quitButton_pressed():
	get_tree().quit()
