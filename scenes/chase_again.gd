extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




func _process(delta):
	var distance = position.distance_to(get_node("mouse").position)
	if distance < 1:  # Adjust the threshold
		print("Game Over")
