extends Node2D

var letterCount = 0
var label_text = "Chowed that up!"
var flash_color = Color(0.067, 0.502, 0.804)
var enterOnce = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$ColorRect.hide()
	$ColorRect/RichTextLabel.bbcode_enabled = true




func _process(delta):
	var distance = position.distance_to(get_node("mouse").position)
	if distance < 1:  # Adjust the threshold
		print("Game Over")
	
	if State.caught and !enterOnce:
		enterOnce = true
		print("caught")
		$letterTimer.start()
		$ColorRect.show()



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


func _on_again_pressed():
	State.caught = false
	ClickSound.find_child("AudioStreamPlayer").play()
	get_tree().change_scene_to_file("res://scenes/chase_again.tscn")


func _on_back_pressed():
	ClickSound.find_child("AudioStreamPlayer").play()
	get_tree().change_scene_to_file("res://scenes/home.tscn")
