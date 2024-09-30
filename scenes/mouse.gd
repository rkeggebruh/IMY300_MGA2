extends Sprite2D

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


func _process(delta):
	#position = get_viewport().get_mouse_position()
	
	var mouse_position = get_viewport().get_mouse_position()
	# Get the screen size (viewport size)
	var screen_size = get_viewport_rect().size
	# Clamp the position so the butterfly stays within screen boundaries
	# Clamp with a 10-pixel margin from the edges
	mouse_position.x = clamp(mouse_position.x, 10, screen_size.x - 10)
	mouse_position.y = clamp(mouse_position.y, 10, screen_size.y - 10)
	
	position = mouse_position
