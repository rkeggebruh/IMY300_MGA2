extends Node2D

var count = 0
var countUP = 0
var countKF = 0
var countLeft = 0
var countRight = 0
var label_display_order = []
var label_to_action = []
var current_label_index = 0



var rng = RandomNumberGenerator.new()

var current_action:String = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	$ninjaCat/sprite.play("idle")
	$labelKick.hide()
	$labelUppercut.hide()
	$labelKickFlip.hide()
	$labelPunch.hide()
	$minusPoint.hide()
	$plusPoint.hide()
	$labelRKick.hide()
	
	# Create a random display order
	_randomize_label_order()
	
	# Start the label flashing cycle
	_on_break_timeout()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#print("CURRENT LABEL " + label_to_action[current_label_index])
	#current_action = label_to_action[current_label_index]
	#print(label_to_action[0])
	#print(label_to_action[1])
	#print(label_to_action[2])
	
	#TO FIND THE ACTION TIED TO LABEL
	#current_action = label_to_action[current_label_index]
	#print("CURRENT LABEL " + current_action)
	
	if(current_action == "space"):
		if Input.is_action_just_released("ui_accept"):
			count += 1
		else:
			# Check if any other key is pressed
			var actions = ["ui_down", "ui_left", "ui_right", "ui_up"]
			for action in actions:
				if Input.is_action_pressed(action):
					print("MINUS POINTS for pressing other key: ", action)
					$minusPoint.show()
					break
	if(current_action == "up"):
		if(Input.is_anything_pressed() == true):
			if Input.is_action_just_pressed("ui_up"):
				countUP += 1
				print("GOOD POINTS for UP")
			else:
				# Check if any other key is pressed
				var actions = ["ui_accept", "ui_left", "ui_right", "ui_down"]
				for action in actions:
					if Input.is_action_pressed(action):
						print("MINUS POINTS for pressing other key: ", action)
						$minusPoint.show()
						break
	if(current_action == "down"):
		if Input.is_action_just_released("ui_down"):
			countKF += 1
		else:
			# Check if any other key is pressed
			var actions = ["ui_accept", "ui_left", "ui_right", "ui_up"]
			for action in actions:
				if Input.is_action_pressed(action):
					print("MINUS POINTS for pressing other key: ", action)
					$minusPoint.show()
					break
	if(current_action == "left"):
		if Input.is_action_just_released("ui_left"):
			countLeft += 1
		else:
			# Check if any other key is pressed
			var actions = ["ui_accept", "ui_down", "ui_right", "ui_up"]
			for action in actions:
				if Input.is_action_pressed(action):
					print("MINUS POINTS for pressing other key: ", action)
					$minusPoint.show()
					break
	if(current_action == "right"):
		if Input.is_action_just_released("ui_right"):
			countRight += 1
		else:
			# Check if any other key is pressed
			var actions = ["ui_accept", "ui_down", "ui_left", "ui_up"]
			for action in actions:
				if Input.is_action_pressed(action):
					print("MINUS POINTS for RIGHT pressing other key: ", action)
					$minusPoint.show()
					break
	
	
	if count == 5:
		$ninjaCat/sprite.play("kick")
		$plusPoint.show()
		count = 0
	
	if countUP == 3:
		$ninjaCat/sprite.play("uppercut")
		$plusPoint.show()
		countUP = 0
	
	if countKF == 4:
		$ninjaCat/sprite.play("flipKick")
		$plusPoint.show()
		countKF = 0
	
	if countLeft == 2:
		$ninjaCat/sprite.play("punch")
		$plusPoint.show()
		countLeft = 0
	
	if countRight == 6:
		print("PLAYING IN THE RIGHT")
		$ninjaCat/sprite.play("roundKick")
		$plusPoint.show()
		countRight = 0

# Shuffle the labels and create a random order
func _randomize_label_order():
	label_display_order = [$labelKick, $labelUppercut, $labelKickFlip, $labelPunch, $labelRKick]
	label_to_action = ["space", "up", "down", "left", "right"]
	#label_display_order.shuffle()

# Show the next label in the order
func _show_next_label():
	_hide_all_labels()
	
	label_display_order[current_label_index].show()
	
	current_action = label_to_action[current_label_index]
	#print("CURRENT LABEL " + current_action)
	
	var my_random_number = rng.randi_range(0, 4)
	current_label_index = my_random_number

# Hide all labels
func _hide_all_labels():
	$labelKick.hide()
	$labelUppercut.hide()
	$labelKickFlip.hide()
	$labelPunch.hide()
	$minusPoint.hide()
	$plusPoint.hide()
	$labelRKick.hide()


func _on_break_timeout():
	_show_next_label()
	$display.start()


func _on_display_timeout():
	_hide_all_labels()
	$break.start()
