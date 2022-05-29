extends Popup

#Video Settings
onready var display_options = $settingsTabs/Video/videoTabContainer/videoSettingsGrid/displayOptionButton
onready var vsync_btn = $settingsTabs/Video/videoTabContainer/videoSettingsGrid/vSyncToggleButton
onready var display_fps_btn = $settingsTabs/Video/videoTabContainer/videoSettingsGrid/fpsToggleButton
onready var max_fps_disp = $settingsTabs/Video/videoTabContainer/videoSettingsGrid/fpsSliderContainer/fpsValueLabel
onready var max_fps_val = $settingsTabs/Video/videoTabContainer/videoSettingsGrid/fpsSliderContainer/fpsSlider
onready var bloom_btn = $settingsTabs/Video/videoTabContainer/videoSettingsGrid/bloomToggleButton
onready var brightness_val = $settingsTabs/Video/videoTabContainer/videoSettingsGrid/brightnessSlider

#Audio Settings
onready var master_vol_val = $settingsTabs/Audio/audioTabContainer/audioSettingsGrid/masterVolSlider
onready var music_vol_val = $settingsTabs/Audio/audioTabContainer/audioSettingsGrid/musicVolSlider
onready var sfx_vol_val = $settingsTabs/Audio/audioTabContainer/audioSettingsGrid/sfxVolSlider

#Control Settings - not implemented

func _ready():
#	popup_centered()


#Video Settings Signals
func _on_displayOptionButton_item_selected(index):
	pass # Replace with function body.

func _on_vSyncToggleButton_toggled(button_pressed):
	pass # Replace with function body.

func _on_fpsToggleButton_toggled(button_pressed):
	pass # Replace with function body.

func _on_fpsSlider_value_changed(value):
	pass # Replace with function body.

func _on_bloomToggleButton_toggled(button_pressed):
	pass # Replace with function body.	

func _on_brightnessSlider_value_changed(value):
	pass # Replace with function body.


#Audio Settings Signals"""

func _on_masterVolSlider_value_changed(value):
	pass # Replace with function body.

func _on_musicVolSlider_value_changed(value):
	pass # Replace with function body.

func _on_sfxVolSlider_value_changed(value):
	pass # Replace with function body.


#Controls Tab Settings"""

