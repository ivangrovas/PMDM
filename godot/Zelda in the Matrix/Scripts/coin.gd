extends Area2D

func _on_body_entered(body):
	
	if body.name=="Player":
		$coinSong.playing=true
		print("hola")
		queue_free()
		
