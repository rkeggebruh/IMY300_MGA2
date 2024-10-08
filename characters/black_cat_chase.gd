extends CharacterBody2D

#var speed = 200  # Adjust the speed as needed
var speed_increment = 0.06
var min_scale = 0.4  # Minimum scale when at the top of the screen
var max_scale = 3.0  # Maximum scale when at the bottom of the screen


func _ready():
	$Timer.start()

func _process(delta):
	if State.chaseSpeed > 250:
		$AnimatedSprite2D.play("running")

	var mouse_position = get_node("../mouse").position
	var direction = (mouse_position - position).normalized()

	# Flip the cat horizontally to face the mouse
	if mouse_position.x < position.x:
		$AnimatedSprite2D.scale.x = -1  # Face left
	else:
		$AnimatedSprite2D.scale.x = 1  # Face right

	# Adjust the cat's scale based on its vertical position (Y-axis)
	var screen_height = get_viewport_rect().size.y
	var scale_factor = position.y / screen_height  # Normalized scale factor based on Y position
	var new_scale = lerp(min_scale, max_scale, scale_factor)

	# Ensure the scale doesn't exceed 7
	new_scale = clamp(new_scale, min_scale, max_scale)

	$AnimatedSprite2D.scale.y = new_scale
	$AnimatedSprite2D.scale.x = $AnimatedSprite2D.scale.x * new_scale   # Keep x-scale aligned with Y scale

	velocity = direction * State.chaseSpeed
	move_and_slide()

func _on_cat_chase_area_mouse_entered():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	State.caught = true
	print("game over for real")
	$Timer.stop()
	State.chaseSpeed = 0
	$AnimatedSprite2D.play("sit")

func _on_timer_timeout():
	State.chaseSpeed *= (1.3 + speed_increment)
	print("new speed: ", State.chaseSpeed)
