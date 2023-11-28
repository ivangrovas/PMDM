extends CharacterBody2D


const speed = 200.0
@export var jump_velocity : float = -300.0
@export var double_jump_velocity : float = -200


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction : Vector2 = Vector2.ZERO
var has_double_jumped : bool = false
var animation_locked : bool = false

@onready var sprite : Sprite2D = $Sprite2D

@onready var animated_sprite : AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_tree: AnimationTree = $AnimationTree

func _ready():
	animation_tree.active = true
	

func update_animation():
	animation_tree.set("parameters/Move/blend_position", direction.x)
	if direction.x < 0:
		animated_sprite.flip_h = false
	elif direction.x > 0:
		animated_sprite.flip_h = true


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		has_double_jumped = false
	
	if Input.is_action_just_pressed("Jump"):
		if is_on_floor():
			# Normal jump from floor
			jump()
		elif not has_double_jumped:
			# Double jump in air
			double_jump()
		
	direction = Input.get_vector("ui_left", "ui_right", "up", "down")
	
	if direction.x != 0:
		velocity.x = direction.x * speed
	else:
		velocity.x = 0

	move_and_slide()
	update_animation()
	update_facing_direction()

func update_facing_direction():
	if direction.x > 0:
		sprite.flip_h = false
	elif direction.x < 0:
		sprite.flip_h = true
		
func jump():
	velocity.y = jump_velocity
	animation_locked = true

func double_jump():
	velocity.y = double_jump_velocity
	animation_locked = true
	has_double_jumped = true
