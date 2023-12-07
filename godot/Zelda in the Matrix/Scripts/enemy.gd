extends CharacterBody2D


@export var speed = 50

var velocidad:int = 50

func _ready():
	velocity.x=-speed

func _physics_process(delta):
	if is_on_wall():
		pass
		if !$AnimatedSprite2D.flip_h:
			velocity.x=speed
		else:
			velocity.x=-speed

	move_and_slide()
	
	if velocity.x < 0:
		$AnimatedSprite2D.flip_h=false
	elif velocity.x >0:
		$AnimatedSprite2D.flip_h=true
