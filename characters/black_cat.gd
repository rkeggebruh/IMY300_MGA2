extends CharacterBody2D

var animations = ["stretch", "meow", "itch", "idle", "lick1", "lick2"]
# Timer variables
var change_animation_timer = 0.0
var time_between_animations = 0.0
var current_animation = ""
var onWalk = true

var isIdle = false

func _physics_process(delta):
	pass

func _process(delta):
	if State.catSpeed != 0:
		$lickL0ng.stop()
	
	#State.catScale
	#pass

func _ready():
	if State.catSpeed != 0:
		$AnimatedSprite2D.play("walk")
	
	$walk.play()
	
	$startTimer.start()

func randomize_animation():
	
	if isIdle:
		var current_animation = animations[4]
		if current_animation != "lick1" or current_animation != "lick2":
			$lickL0ng.stop()
		# Play the selected animation
		print("curretnt: ", current_animation)
		$AnimatedSprite2D.play(current_animation)
		if current_animation == "meow":
			$meow.play()
		elif current_animation == "lick1":
			$lickL0ng.play()
		elif current_animation == "lick2":
			$lickL0ng.play()
		elif current_animation == "stretch":
			$stretch.play()
		elif current_animation == "itch":
			$scratch.play()
		isIdle = false
	else:
		# Select a random animation from the list
		var current_animation = animations[randi() % animations.size()]
		if current_animation != "lick1" or current_animation != "lick2":
			$lickL0ng.stop()
		# Play the selected animation
		print("curretnt: ", current_animation)
		if current_animation == "meow":
			$meow.play()
		elif current_animation == "lick1":
			$lickL0ng.play()
		elif current_animation == "lick2":
			$lickL0ng.play()
		elif current_animation == "stretch":
			$stretch.play()
		elif current_animation == "itch":
			$scratch.play()
		$AnimatedSprite2D.play(current_animation)
		isIdle = true


func _on_animated_sprite_2d_animation_finished():
	print("calling new")
	if !onWalk:
		$walk.stop()
		randomize_animation()
	
	if $AnimatedSprite2D.animation == "getUp":
		$AnimatedSprite2D.play("walk")
		$walk.play()
		State.catSpeed = 0.08
		$onWalk.start()
		onWalk = true


func _on_start_timer_timeout():
	print("starter timer finished")
	$startTimer.stop()
	$walkTimer.start()
	State.catSpeed = 0
	$walk.stop()
	onWalk = false
	randomize_animation()


func _on_walk_timer_timeout():
	print("idle timer done - start walking")
	$walkTimer.stop()
	$onWalk.wait_time = randi_range(3, 9)
	$onWalk.start()
	onWalk = true
	$walk.play()
	State.catSpeed = 0.08
	$AnimatedSprite2D.play("walk")


func _on_on_walk_timeout():
	print("walk timer done - start idle")
	$onWalk.stop()
	$walk.stop()
	onWalk = false
	$walkTimer.start()
	State.catSpeed = 0
	randomize_animation()
