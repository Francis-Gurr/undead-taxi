extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

#const SPEED = 100.0
#const MAX_SPEED = 200
#const MASS = 5
const ENGINE_POWER = 800
const FRICTION = -2.0
const DRAG = -0.0015
var acceleration = Vector2.ZERO

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var x_direction := Input.get_axis("left", "right")
	var y_direction := Input.get_axis("up", "down")
	acceleration = Vector2(x_direction, y_direction) * ENGINE_POWER
	
	apply_friction()
	velocity += acceleration * delta
	
	#if acceleration.length() > 0 and velocity.length() < MAX_SPEED:
		#velocity += acceleration
	#elif acceleration.length() == 0 and velocity.length() > 0:
		#var deceleration := -1 * velocity.normalized()
		#velocity += deceleration 
		#velocity.max(Vector2())
	print(velocity)
	#if x_direction:
		#velocity.x = x_direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
	#
	#if y_direction:
		#velocity.y = y_direction * SPEED
	#else:
		#velocity.y = move_toward(velocity.y, 0, SPEED)
		
	set_animation()

	move_and_slide()

func apply_friction():
	if velocity.length() < 5:
		velocity = Vector2.ZERO
	var friction_force = velocity * FRICTION
	var drag_force = velocity * velocity.length() * DRAG
	if velocity.length() < 100:
		friction_force *= 3
	acceleration += drag_force + friction_force
	
func set_animation():
	if velocity.x == 0 and velocity.y < 0:
		animated_sprite_2d.play("north")
	if velocity.x == 0 and velocity.y > 0:
		animated_sprite_2d.play("south")
	if velocity.x > 0 and velocity.y == 0:
		animated_sprite_2d.play("east")
	if velocity.x < 0 and velocity.y == 0:
		animated_sprite_2d.play("west")
	if velocity.x < 0 and velocity.y < 0:
		animated_sprite_2d.play("north-west")
	if velocity.x < 0 and velocity.y > 0:
		animated_sprite_2d.play("south-west")
	if velocity.x > 0 and velocity.y < 0:
		animated_sprite_2d.play("north-east")
	if velocity.x > 0 and velocity.y > 0:
		animated_sprite_2d.play("south-east")
