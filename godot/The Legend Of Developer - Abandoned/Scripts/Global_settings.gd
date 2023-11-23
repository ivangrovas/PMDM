extends Node

var os = Engine.get_singleton("OS")

func change_display_mode(toggle: bool) -> void:
	if toggle:
		OS.set_window_mode(OS.WINDOW_FULLSCREEN)
	else:
		OS.set_window_mode(OS.WINDOW_RESIZABLE)
	
