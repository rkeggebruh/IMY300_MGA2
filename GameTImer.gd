extends Node


var letterCount = 0
var label_text = "YOU HAVE COMPLETED MEOWCHI!"  # Your label's actual text
var flash_color = Color(1, 0.42, 0.478)
var enterOnce = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$love.value = State.attentionStatus
	$hunger.value = State.hungerStatus
	$boredom2.value = State.boredStatus
	$dexterity.value = State.dexterityStatus
	$RichTextLabel.bbcode_enabled = true
	$love.hide()
	$hunger.hide()
	$boredom2.hide()
	$dexterity.hide()
	$Summer5.hide()
	$RichTextLabel.hide()
	
	if ((State.hungerStatus + State.attentionStatus + State.boredStatus + State.dexterityStatus)/4) > 50:
		$dexterity/Label.text = "Meowchi loves you! And you are such a good parent <3"
	else:
		$dexterity/Label.text = "Meowchi is a bit mad at you, but luckily he always forgives <3"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if State.gameOver and !enterOnce:
		enterOnce = true
		$dexterity/Label.text = "You killed Meowchi! You are such a terrible parent!"
		$Timer.stop()
		$love.show()
		$hunger.show()
		$boredom2.show()
		$dexterity.show()
		$Summer5.show()
		$RichTextLabel.show()
		$letterTimer.start()
		print("----------- GAME FINISHED -------------")
	
	#print(str($Timer.time_left))
	if State.tenMins and State.timerUpdated:
		State.timerUpdated = false
		$Timer.wait_time = 600
	if State.twentyMins and State.timerUpdated:
		State.timerUpdated = false
		$Timer.wait_time = 1200
	if State.thirtyMins and State.timerUpdated:
		State.timerUpdated = false
		$Timer.wait_time = 1800
	if State.foreverMins and State.timerUpdated:
		State.timerUpdated = false
		$Timer.wait_time = 3000


func _on_timer_timeout():
	$Timer.stop()
	$love.show()
	$hunger.show()
	$boredom2.show()
	$dexterity.show()
	$Summer5.show()
	$RichTextLabel.show()
	$letterTimer.start()
	print("----------- GAME FINISHED -------------")




func _on_break_timer_timeout():
	$breakTimer.stop()
	letterCount = 0
	$letterTimer.start()


func _on_letter_timer_timeout():
	if letterCount == len(label_text):
		$Timer.stop()
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
	$RichTextLabel.bbcode_text = formatted_text

	# Move to the next letter
	letterCount += 1


func _on_button_pressed():
	$love.hide()
	$hunger.hide()
	$boredom2.hide()
	$dexterity.hide()
	$Summer5.hide()
	$RichTextLabel.hide()
	ClickSound.find_child("AudioStreamPlayer").play()
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
