extends CharacterBody2D

var animations = ["stretch", "meow", "itch", "idle", "lick1"]
# Timer variables
var change_animation_timer = 0.0
var time_between_animations = 0.0
var current_animation = ""

var isIdle = false

func _physics_process(delta):
	pass

func _ready():
	randomize_animation()

func randomize_animation():
	if isIdle:
		var current_animation = animations[4]
		# Play the selected animation
		print("curretnt: ", current_animation)
		$AnimatedSprite2D.play(current_animation)
		isIdle = false
	else:
		# Select a random animation from the list
		var current_animation = animations[randi() % animations.size()]
		# Play the selected animation
		print("curretnt: ", current_animation)
		$AnimatedSprite2D.play(current_animation)
		isIdle = true


func _on_animated_sprite_2d_animation_finished():
	print("calling new")
	randomize_animation()
