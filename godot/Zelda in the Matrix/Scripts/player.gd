extends CharacterBody2D


const speed = 200.0
@export var jump_velocity : float = -150.0
@export var double_jump_velocity : float = -100


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction : Vector2 = Vector2.ZERO
var was_in_air : bool = false
var has_double_jumped : bool = false
var animation_locked : bool = false

@onready var animated_sprite : AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_tree: AnimationTree = $AnimationTree

func _ready():
	animation_tree.active = true
	

func update_animation():
	animation_tree.set("parameters/Move/blend_position", direction.x)


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		was_in_air = true
	else:
		has_double_jumped = false
		
		if was_in_air == true:
			land()
			
		was_in_air = false
	
	if Input.is_action_just_pressed("Jump"):
		if is_on_floor():
			# Normal jump from floor
			jump()
		elif not has_double_jumped:
			# Double jump in air
			double_jump()
		
	direction = Input.get_vector("ui_left", "ui_right", "up", "down")
	
	if direction.x != 0 && animated_sprite.animation != "jump_end":
		velocity.x = direction.x * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()
	update_animation()
	
func land():
	animated_sprite.play("jump_end")
	animation_locked = true

func jump():
	velocity.y = jump_velocity
	animated_sprite.play("jump_start")
	animation_locked = true

func double_jump():
	velocity.y = double_jump_velocity
	animated_sprite.play("jump_double")
	animation_locked = true
	has_double_jumped = true
