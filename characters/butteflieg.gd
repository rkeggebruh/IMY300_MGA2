extends Node2D

var speed = 300
var target_position = Vector2()
var speed_increment = 0.05
var clamped_mouse_position

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	$Timer.start()

func _physics_process(delta):
	
	_mouse_pos()
	
	$butterfly.position = clamped_mouse_position

	# Check if the player is in a 3px range of the click position, if not move to the target position
	if $cat.position.distance_to(clamped_mouse_position) > 2:
		target_position = (clamped_mouse_position - $cat.position).normalized()
		$cat.velocity = target_position * speed
		$cat.move_and_slide()
		
		# Flip the cat horizontally based on mouse movement direction
		if clamped_mouse_position.x < ($cat.position.x + 5):
			$cat/AnimatedSprite2D.flip_h = true
		else:
			$cat/AnimatedSprite2D.flip_h = false
		
		#print("speed: ", speed)
		
		if speed > 500:
			$cat/AnimatedSprite2D.play("run")
		else:
			$cat/AnimatedSprite2D.play("walk")


func _on_timer_timeout():
	speed *= (1.3 + speed_increment)


func _mouse_pos():
	var mouse_position = get_global_mouse_position()
	var screen_size = get_viewport().size
	var bottom_half_start = screen_size.y / 5
	var bottom_half_end = screen_size.y
	var usable_height = (bottom_half_end - bottom_half_start) * 0.8
	var min_y = bottom_half_start + ((bottom_half_end - bottom_half_start) - usable_height) / 2
	var max_y = min_y + usable_height
	clamped_mouse_position = Vector2(mouse_position.x, clamp(mouse_position.y, min_y, max_y))




func _on_area_2d_body_entered(body):
	print("body: " + body.name)
	if(body.name == "cat"):
		print("CAUGHT")
