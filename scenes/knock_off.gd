extends Node2D

func _process(delta):
	# Get the mouse position
	var mouse_position = get_viewport().get_mouse_position()
	
	# Adjust the offset based on the cat's paw alignment
	var offset = Vector2(-65, -320)
	var paw_position = mouse_position + offset
	
	# Get the screen size
	var screen_size = get_viewport().get_visible_rect().size
	
	# Define margins
	var margin = 0
	
	# Clamp the position so it stays within the screen bounds with the given margin
	paw_position.x = clamp(paw_position.x, margin, screen_size.x - 150)
	paw_position.y = clamp(paw_position.y, margin, screen_size.y - 200)
	
	# Update the position of the node
	position = paw_position
