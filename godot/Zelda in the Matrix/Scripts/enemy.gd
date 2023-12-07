extends CharacterBody2D

var speed:int = 50
var perseguir:bool = false
var vel_perseguidor:int=100

func _ready():
	velocity.x=-speed

func _physics_process(delta):
	detector()
	if !perseguir:
		if is_on_wall():
			if !$AnimatedSprite2D.flip_h:
				velocity.x=speed
			else:
				velocity.x=-speed
			
		if velocity.x < 0:
			$AnimatedSprite2D.flip_h=false
		elif velocity.x >0:
			$AnimatedSprite2D.flip_h=true
	move_and_slide()

func detector():
	if $right.is_colliding():
		var obj = $right.get_collider()
		if obj.is_in_group("player"):
			perseguir=true
			velocity.x=vel_perseguidor
			$AnimatedSprite2D.flip_h=true
		else: 
			perseguir=false
	
	if $left.is_colliding():
		var obj = $left.get_collider()
		if obj.is_in_group("player"):
			perseguir=true
			velocity.x= -vel_perseguidor
			$AnimatedSprite2D.flip_h=false
		else: 
			perseguir=false
