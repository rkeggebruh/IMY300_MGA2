extends Node2D

var soap = false
var food = false
var lamp = false
var cup = false
var plant = false
var catBed = false
var insOne = true

func _ready():
	$boredom2.value = State.boredStatus
	$done.hide()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if insOne:
		if Input.is_action_just_released("ui_accept"):
			print("hiding noe")
			insOne = false
			$intro.hide()
	
	if soap and food and lamp and cup and plant and catBed:
		Input.set_custom_mouse_cursor(null)
		$done.show()
	
	# Get the mouse position
	var mouse_position = get_viewport().get_mouse_position()
	
	# Get the screen size
	var screen_size = get_viewport().get_visible_rect().size
	
	# Define margins (optional) if you want to leave some space around the edges
	var margin = 0  # Change to a positive number if you want margins
	
	# Clamp the mouse position so it stays within the screen bounds
	mouse_position.x = clamp(mouse_position.x, margin, screen_size.x - margin)
	mouse_position.y = clamp(mouse_position.y, margin, screen_size.y - margin)
	



func _on_cup_area_mouse_entered():
	cup = true
	$knockOff2.play()
	$boredom2.value += 5
	State.boredStatus += 5
	$Cup/cupOff.play("knock")


func _on_plant_area_mouse_entered():
	plant = true
	$knockOff2.play()
	$boredom2.value += 5
	State.boredStatus += 5
	$Plant/plantOff.play("knock")


func _on_soap_area_mouse_entered():
	soap = true
	$knockOff2.play()
	$boredom2.value += 5
	State.boredStatus += 5
	$Soap/soapOff.play("knock")


func _on_cat_food_area_mouse_entered():
	food = true
	$knockOff2.play()
	$boredom2.value += 5
	State.boredStatus += 5
	$CatFood/foodOf.play("knock")


func _on_lamp_areea_mouse_entered():
	lamp = true
	$knockOff2.play()
	$boredom2.value += 5
	State.boredStatus += 5
	$Lamp/lampOff.play("knock")

func _on_cat_bed_area_mouse_entered():
	catBed = true
	$knockOff2.play()
	$boredom2.value += 5
	State.boredStatus += 5
	$Catbed/catBedOff.play("knock")


func _on_again_pressed():
	ClickSound.find_child("AudioStreamPlayer").play()
	get_tree().change_scene_to_file("res://scenes/node_2d.tscn")


func _on_back_pressed():
	ClickSound.find_child("AudioStreamPlayer").play()
	get_tree().change_scene_to_file("res://scenes/home.tscn")
