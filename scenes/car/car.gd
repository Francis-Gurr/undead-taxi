extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 100.0

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var x_direction := Input.get_axis("left", "right")
	var y_direction := Input.get_axis("up", "down")
	if x_direction:
		velocity.x = x_direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if y_direction:
		velocity.y = y_direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
	set_animation()

	move_and_slide()

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
