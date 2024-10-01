extends Node2D

var count = 0
var countUP = 0
var countKF = 0
var countLeft = 0
var countRight = 0
var label_display_order = []
var label_to_action = []
var current_label_index = 0
var wrongCount = 0

# for died
var letterCount = 0
var label_text = "You are out of lives kitty cat, Meowchi's back"
var flash_color = Color(1, 0.122, 0.278)

var rng = RandomNumberGenerator.new()

var current_action:String = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	$trainer.hide()
	$ColorRect.hide()
	$ColorRect/RichTextLabel.bbcode_enabled = true
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
		#print("count == ", count)
		$labelKick.text = "SPACE X " + str(5-count)
		if Input.is_action_just_released("ui_accept"):
			count += 1
			#$labelKick.text = "SPACE X " + str(5-count)
		else:
			# Check if any other key is pressed
			var actions = ["ui_down", "ui_left", "ui_right", "ui_up"]
			for action in actions:
				if Input.is_action_pressed(action):
					print("MINUS POINTS for pressing other key in SPACE: ", action)
					#$minusPoint.show()
					$eish.play()
					wrongCount = wrongCount + 1
					current_action = "none"
					_hide_all_labels()
					$break.start()
					$display.stop()
					#current_action = "none"
					#_show_next_label()
					break
	if(current_action == "up"):
		#print("countUP == ", countUP)
		$labelUppercut.text = "UP X " + str(3-countUP)
		if Input.is_action_just_pressed("ui_up"):
			countUP += 1
			#$labelUppercut.text = "UP X " + str(3-countUP)
			#print("GOOD POINTS for UP")
		else:
			# Check if any other key is pressed
			var actions = ["ui_accept", "ui_left", "ui_right", "ui_down"]
			for action in actions:
				if !(action == "ui_up"):
					if Input.is_action_pressed(action):
						print("MINUS POINTS for pressing other key in UP: ", action)
						#$minusPoint.show()
						$eish.play()
						wrongCount = wrongCount + 1
						current_action = "none"
						_hide_all_labels()
						$break.start()
						$display.stop()
						#current_action = "none"
						#_show_next_label()
						break
	if(current_action == "down"):
		$labelKickFlip.text = "DOWN X " + str(4-countKF)
		if Input.is_action_just_released("ui_down"):
			countKF += 1
			#$labelKickFlip.text = "DOWN X " + str(4-countKF)
		else:
			# Check if any other key is pressed
			var actions = ["ui_accept", "ui_left", "ui_right", "ui_up"]
			for action in actions:
				if Input.is_action_pressed(action):
					print("MINUS POINTS for pressing other key in DOWN: ", action)
					#$minusPoint.show()
					$eish.play()
					wrongCount = wrongCount + 1
					current_action = "none"
					_hide_all_labels()
					$break.start()
					$display.stop()
					#current_action = "none"
					#_show_next_label()
					break
	if(current_action == "left"):
		$labelPunch.text = "LEFT X " + str(2-countLeft)
		if Input.is_action_just_released("ui_left"):
			countLeft += 1
		else:
			# Check if any other key is pressed
			var actions = ["ui_accept", "ui_down", "ui_right", "ui_up"]
			for action in actions:
				if Input.is_action_pressed(action):
					print("MINUS POINTS for pressing other key in LEFT: ", action)
					#$minusPoint.show()
					$eish.play()
					wrongCount = wrongCount + 1
					current_action = "none"
					_hide_all_labels()
					$break.start()
					$display.stop()
					#current_action = "none"
					#_show_next_label()
					break
	if(current_action == "right"):
		$labelRKick.text = "RIGHT X " + str(6-countRight)
		if Input.is_action_just_released("ui_right"):
			countRight += 1
			#$labelRKick.text = "RIGHT X " + str(6-countRight)
		else:
			# Check if any other key is pressed
			var actions = ["ui_accept", "ui_down", "ui_left", "ui_up"]
			for action in actions:
				if Input.is_action_pressed(action):
					print("MINUS POINTS for RIGHT pressing other key in RIGHT: ", action)
					#$minusPoint.show()
					$eish.play()
					wrongCount = wrongCount + 1
					current_action = "none"
					_hide_all_labels()
					$break.start()
					$display.stop()
					#current_action = "none"
					#_show_next_label()
					break
	
	
	if count == 5:
		count = 0
		if State.catOptOne:
			$ninjaCat/fireballCat.play("fireKick")
		elif State.catOptTwo:
			$ninjaCat/ak47.play("flipKick")
		elif State.catOptThree:
			$ninjaCat/sprite.play("kick")
		
		current_action = "none"
		#_randomize_label_order()
		#$plusPoint.show()
		$trainer.show()
		$yippee.play()
		print("calling next label in space")
		#_show_next_label()$break.start()
		_hide_all_labels()
		$display.stop()
		$break.start()
	
	if countUP == 3:
		current_action = "none"
		print("countUP: ", countUP)
		countUP = 0
		if State.catOptOne:
			$ninjaCat/fireballCat.play("fireballHorizontalUp")
		elif State.catOptTwo:
			$ninjaCat/ak47.play("jumpShoot")
		elif State.catOptThree:
			$ninjaCat/sprite.play("uppercut")
		#$ninjaCat/sprite.play("uppercut")
		current_action = "none"
		#$plusPoint.show()
		$trainer.show()
		$yippee.play()
		print("calling next label in UP")
		#_show_next_label()
		_hide_all_labels()
		$break.start()
		
	
	if countKF == 4:
		countKF = 0
		if State.catOptOne:
			$ninjaCat/fireballCat.play("firePunch2")
		elif State.catOptTwo:
			$ninjaCat/ak47.play("playDead")
		elif State.catOptThree:
			$ninjaCat/sprite.play("flipKick")
		#$ninjaCat/sprite.play("flipKick")
		current_action = "none"
		print("calling next label in KF")
		$break.start()
		$display.stop()
		#_show_next_label()
		_hide_all_labels()
		#_randomize_label_order()
		#$display.stop()
		#$plusPoint.show()
		$trainer.show()
		$yippee.play()
		
	
	if countLeft == 2:
		countLeft = 0
		if State.catOptOne:
			$ninjaCat/fireballCat.play("fireSpin")
		elif State.catOptTwo:
			$ninjaCat/ak47.play("shoot")
		elif State.catOptThree:
			$ninjaCat/sprite.play("punch")
		#$ninjaCat/sprite.play("punch")
		current_action = "none"
		#_hide_all_labels()
		#_show_next_label()
		_hide_all_labels()
		$break.start()
		$display.stop()
		print("calling next label in Left")
		#$display.stop()
		#$plusPoint.show()
		$trainer.show()
		$yippee.play()
		
	
	if countRight == 6:
		if State.catOptOne:
			$ninjaCat/fireballCat.play("handMove")
		elif State.catOptTwo:
			$ninjaCat/ak47.play("flipKick")
		elif State.catOptThree:
			$ninjaCat/sprite.play("roundKick")
		#print("PLAYING IN THE RIGHT")
		#$ninjaCat/sprite.play("roundKick")
		current_action = "none"
		#_hide_all_labels()
		print("calling next label in Right")
		#_show_next_label()
		_hide_all_labels()
		$break.start()
		$display.stop()
		#$plusPoint.show()
		$trainer.show()
		$yippee.play()
		countRight = 0

# Shuffle the labels and create a random order
func _randomize_label_order():
	label_display_order = [$labelKick, $labelUppercut, $labelKickFlip, $labelPunch, $labelRKick]
	label_to_action = ["space", "up", "down", "left", "right"]
	#label_display_order.shuffle()

var previous_label_index = -1  # Store the previous label index


# Show the next label in the order
func _show_next_label():
	
	if wrongCount < 3:
		#print("show next laebl called")
		$break.stop()
		_hide_all_labels()

		# Ensure the next label is different from the previous one
		var my_random_number = rng.randi_range(0, 4)
		while my_random_number == previous_label_index:
			my_random_number = rng.randi_range(0, 4)
		
		current_label_index = my_random_number
		label_display_order[current_label_index].show()
		current_action = label_to_action[current_label_index]
		$trainer.hide()
		previous_label_index = current_label_index
		$display.start()  # Update the previous label index
	#index


# Hide all labels
func _hide_all_labels():
	if wrongCount == 1:
		$Heart3.show()
		$Heart4.show()
		$Heart5.hide()
	elif wrongCount == 2:
		$Heart3.show()
		$Heart4.hide()
		$Heart5.hide()
	elif wrongCount == 3:
		current_action = "none"
		$break.stop()
		$display.stop()
		$ColorRect.show()
		$letterTimer.start()
		#CEHCK - stop game after this and go back to home screen
		$Heart3.hide()
		$Heart4.hide()
		$Heart5.hide()
	
	$labelKick.hide()
	$labelUppercut.hide()
	$labelKickFlip.hide()
	$labelPunch.hide()
	$minusPoint.hide()
	$plusPoint.hide()
	#$trainer.hide()
	$labelRKick.hide()
	count = 0
	countUP = 0
	countKF = 0
	countRight = 0
	countLeft = 0


func _on_break_timeout():
	print("break timeout - calling next label")
	_show_next_label()
	$display.start()


func _on_display_timeout():
	if count == 5:
		$eish.play()
		wrongCount = wrongCount + 1
	
	if countUP == 3:
		$eish.play()
		wrongCount = wrongCount + 1
	
	if countKF == 4:
		$eish.play()
		wrongCount = wrongCount + 1
	
	if countLeft == 2:
		$eish.play()
		wrongCount = wrongCount + 1
	
	if countRight < 6:
		$eish.play()
		wrongCount = wrongCount + 1
	
	print("display timeout")
	_hide_all_labels()
	$break.start()



func _on_letter_timer_timeout():
	if letterCount == len(label_text):
		$letterTimer.stop()
		$breakTimer.start()
	
	var formatted_text = "[center]"  # Start with the center BBCode tag
	
	# Loop through each letter in the actual label text
	for i in range(len(label_text)):
		if i == letterCount:
			# Flash the current letter
			formatted_text += "[color=" + flash_color.to_html() + "]" + label_text[i] + "[/color]"
		else:
			# Keep other letters normal
			formatted_text += label_text[i]

	# Close the BBCode center tag
	formatted_text += "[/center]"

	# Update the RichTextLabel with the new formatted text
	$ColorRect/RichTextLabel.bbcode_text = formatted_text

	# Move to the next letter
	letterCount += 1

func _on_break_timer_timeout():
	$breakTimer.stop()
	letterCount = 0
	$letterTimer.start()


func _on_restart_pressed():
	get_tree().change_scene_to_file("res://characters/choose_cat.tscn")


func _on_home_pressed():
	get_tree().change_scene_to_file("res://scenes/home.tscn")


func _on_make_harder_timeout():
	print("making it harder")
	$makeHarder.stop()
	$display.wait_time = 2
	$break.wait_time = 0.5
	$makeItHarder2.start()


func _on_make_it_harder_2_timeout():
	print("making it harder 2")
	$makeItHarder2.stop()
	$display.wait_time = 1.6
	$break.wait_time = 0.2
	$makeitHarder3.start()


func _on_makeit_harder_3_timeout():
	print("making it harder 3")
	$makeitHarder3.stop()
	$makeItHarder2.stop()
	$display.wait_time = 1.3
	$break.wait_time = 0.1
	$makeitHarder3.start()
