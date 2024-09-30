extends Node2D

var animations = ["lick", "stretch", "meow", "idle"]
# Timer variables
var change_animation_timer = 0.0
var time_between_animations = 1.0  # Set a default time for switching animations
var current_animation = ""
var isIdle = false

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize_animation()
	# Start the timer to change animation
	#$Timer.start()


func randomize_animation():
	if isIdle:
		current_animation = "idle"  # Correctly assign "idle" animation
	else:
		# Select a random animation from the list
		current_animation = animations[randi() % animations.size()]
	
	# Play the selected animation
	print("current: ", current_animation)
	$AnimatedSprite2D.play(current_animation)
	isIdle = !isIdle  # Toggle isIdle state

func _on_animated_sprite_2d_animation_finished():
	print("calling new")
	randomize_animation()
