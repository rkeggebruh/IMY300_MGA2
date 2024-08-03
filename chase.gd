extends CharacterBody2D

var speed = 300
var mouse_position = Vector2()
var target_position = Vector2()
var speed_increment = 0.05  # 5%

#var arrow = load("res://assets/plant3.png")

func _ready():
	$Node2D/butterfly.position = get_global_mouse_position()
	#Input.set_custom_mouse_cursor(arrow)
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	# Set the click position to the player's current position
	mouse_position = position
	$Timer.start()

func _physics_process(delta):
	$Node2D/butterfly.position = get_global_mouse_position()
	
	#mouse_position = get_global_mouse_position()
	#print("SPEED: " , speed)
	## Check if the player is in a 3px range of the click position, if not move to the target position
	if position.distance_to($Node2D/butterfly.position) > 2:
		target_position = ($Node2D/butterfly.position - position).normalized()
		velocity = target_position * speed
		$".".move_and_slide()


func _on_timer_timeout():
	speed *= (1.3 + speed_increment)
