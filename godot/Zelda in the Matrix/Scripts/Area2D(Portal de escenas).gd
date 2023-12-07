extends Area2D


var entered = false

func _on_body_entered(body:PhysicsBody2D):
	entered = true

	
func _physics_process(delta):
	if entered == true:
		#if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene_to_file("res://Escenas/level_1.tscn")


func _on_body_exited(body):
	entered=false
