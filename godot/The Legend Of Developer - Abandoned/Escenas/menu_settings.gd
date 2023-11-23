extends Control


#Video Settings
@onready var display_options = get_node("SettingsTabs/Video/MarginContainer/VideoSettings/OptionButton")
@onready var vsync_btn = get_node("SettingsTabs/Video/MarginContainer/VideoSettings/CheckButton")

#Audio Settings
@onready var master_slide = get_node("SettingsTabs/Audio/MarginContainer/VideoSettings/Slider_audio")

func _ready():
	pass
	


func _on_option_button_item_selected(index):
	GlobalSettings.change_displayMode(index)


func _on_check_button_toggled(button_pressed):
	pass # Replace with function body.
