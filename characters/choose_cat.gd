extends Node2D

var InsOne = false
var InsTwo = false
var InsThree = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$catOne.hide()
	$catTwo.hide()
	$catThree.hide()
	$sensei2.hide()
	$sensei3.hide()
	$meowchi1.hide()
	InsOne = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if Input.is_action_just_pressed('leftClick'):
		#print('clicked!')
	
	if Input.is_action_just_released("ui_accept") and InsOne:
		InsOne = false
		InsTwo = true
		$sensei1.hide()
		$meowchi1.show()
	elif Input.is_action_just_released("ui_accept") and InsTwo:
		InsTwo = false
		InsThree = true
		$meowchi1.hide()
		$sensei2.show()
	elif Input.is_action_just_released("ui_accept") and InsThree:
		InsThree = false
		$sensei2.hide()
		$catOne.show()
		$catTwo.show()
		$catThree.show()


func _on_cat_one_area_mouse_entered():
	$catOne/AnimatedSprite2D.play("outline")
	$catOne/catOneLableAnim.play("label")

func _on_cat_one_area_mouse_exited():
	$catOne/AnimatedSprite2D.play("default")
	$catOne/catOneLableAnim.play("labelOff")


func _on_cat_two_area_mouse_entered():
	$catTwo/catTwoAnim.play("label")
	$catTwo/AnimatedSprite2D.play("outline")


func _on_cat_two_area_mouse_exited():
	$catTwo/catTwoAnim.play("labelOff")
	$catTwo/AnimatedSprite2D.play("default")


func _on_cat_three_area_mouse_entered():
	$catThree/catThreeAnim.play("label")
	$catThree/AnimatedSprite2D.play("outline")


func _on_cat_three_area_mouse_exited():
	$catThree/catThreeAnim.play("labelOff")
	$catThree/AnimatedSprite2D.play("default")


func _on_cat_one_area_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed('leftClick'):
		print('clicked on cat one')
		State.catOptOne = true
		get_tree().change_scene_to_file("res://scenes/pr_etraining.tscn")

func _on_cat_two_area_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed('leftClick'):
		print('clicked on cat one')
		State.catOptTwo = true
		get_tree().change_scene_to_file("res://scenes/pr_etraining.tscn")

func _on_cat_three_area_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed('leftClick'):
		print('clicked on cat one')
		State.catOptThree = true
		get_tree().change_scene_to_file("res://scenes/pr_etraining.tscn")
