extends Control

var letterCount = 0
var label_text = "The adventures of MEOWCHI"  # Your label's actual text
var flash_color = Color(1, 0.42, 0.478)  # Color to flash the letter
var exit = false
var opt = false
var start = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$RichTextLabel.bbcode_enabled = true  # Enable BBCode
	$Timer.start()

func _on_timer_timeout():
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


func _on_break_timer_timeout():
	$breakTimer.stop()
	letterCount = 0
	$Timer.start()


func _on_start_pressed():
	$bg.stop()
	ClickSound.find_child("AudioStreamPlayer").play()
	get_tree().change_scene_to_file("res://scenes/home.tscn")
	start = true
	#get_tree().change_scene_to_file("res://scenes/home.tscn")


func _on_quit_pressed():
	get_tree().quit()


#func _on_click_finished():
	#if start:
		#ClickSound.find_child("AudioStreamPlayer").play()
		#get_tree().change_scene_to_file("res://scenes/home.tscn")
		#start = false
	#elif exit:
		#get_tree().quit()
		#exit = false
