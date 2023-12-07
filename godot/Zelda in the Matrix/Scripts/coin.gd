extends Area2D

func _on_body_entered(body):
	
	if body.name=="Player":
		get_parent().monedas +=1
		print(str(get_parent().monedas))
		$AudioStreamPlayer2D.playing=true
		queue_free()
		
