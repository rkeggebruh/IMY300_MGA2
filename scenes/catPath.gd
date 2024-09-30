extends PathFollow2D

var previous_position: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

	previous_position = global_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	# Handle movement if speed is not zero
	if State.catSpeed != 0:
		progress_ratio += delta * State.catSpeed
		
		var current_position = global_position
		var movement_direction = current_position - previous_position
		previous_position = current_position
			
		if movement_direction.x > 0:  # NPC moving right
			$"black cat".scale.x = 10  # Face right
		elif movement_direction.x < 0:  # NPC moving left
			$"black cat".scale.x = -10  # Face left
