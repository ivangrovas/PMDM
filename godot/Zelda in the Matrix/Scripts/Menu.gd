extends Control

@onready var menu = $Control
@onready var options = $Settings
@onready var videos = $Video
@onready var audio = $Audio

var user_prefs: UserPreferences

# Called when the node enters the scene tree for the first time.
func _ready():
	user_prefs = UserPreferences.load_or_create()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_pressed():
	get_tree().change_scene_to_file("res://Escenas/test_level.tscn")


func _on_settings_pressed():
	show_and_hide(options, menu)


func _on_exit_pressed():
	get_tree().quit()

func show_and_hide(options: Control, control: Control):

		options.show()
		control.hide()

func _on_video_pressed():
	show_and_hide(videos, options)


func _on_audio_pressed():
	show_and_hide(audio,options)


func _on_back_from_settings_pressed():
	show_and_hide(menu, options)


func _on_full_screen_toggled(button_pressed):
	if button_pressed == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		user_prefs.save()
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		user_prefs.save()
	
func _on_borderless_toggled(button_pressed):
	if button_pressed == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func _on_back_from_video_pressed():
	show_and_hide(options,videos) # Replace with function body.


func _on_master_value_changed(value):
	volume(0, value)

func volume(bus_index,value):
	AudioServer.set_bus_volume_db(bus_index, value)
	user_prefs.save()


func _on_music_value_changed(value):
	volume(1, value)


func _on_back_from_audio_pressed():
	show_and_hide(options,audio)


func _on_back_from_settings_menu_pressed():
	show_and_hide(menu,options)
