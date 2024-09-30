extends PathFollow2D

var previous_position: Vector2
var speed = 0.1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
	previous_position = global_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		
	progress_ratio += delta * speed
		
	var current_position = global_position
	var movement_direction = current_position - previous_position
	previous_position = current_position
		
	if movement_direction.x > 0:  # NPC moving right
		$butterfly.scale.x = 3  # Face right
	elif movement_direction.x < 0:  # NPC moving left
		$butterfly.scale.x = -3  # Face left
