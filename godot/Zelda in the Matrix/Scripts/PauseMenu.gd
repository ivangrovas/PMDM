extends Control

get_tree().paused 

func _unhandled_input(event):
	if Input.is_action_just_pressed("Pause"):
		
