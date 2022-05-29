extends Node

signal fps_displayed(value)

func toggle_fullscreen(value):
	OS.window_fullscreen = value
	
func toggle_vsync(value):
	OS.vsync_enabled = value
	
func toggle_fps_display(value):
	emit_signal("fps_display", value)
