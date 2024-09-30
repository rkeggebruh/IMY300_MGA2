extends Node2D

var rng = RandomNumberGenerator.new()
var count = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$heart1.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if State.onPause:
		#$heart1Time.stop()
	pass


func _on_deplete_timeout():
	$love.value -= 10


func _on_petting_cat_mouse_entered():
	$love.value += 10
	$heart1.show()
	$heart1Time.start()

func _on_petting_cat_mouse_exited():
	#$heart1Time.stop()
	pass


func _on_heart_1_time_timeout():
	#print("timer 1")
	$heart1.hide()




func _on_in_cat_bed_body_entered(body):
	count = count + 1
	if count == 1 or count == 4:
		if count == 4:
			count = 0
		State.catSpeed = 0
		State.catSleeping = true
		$"Path2D/catPath/black cat".find_child("walk").stop()
		$purring.play()
		$"Path2D/catPath/black cat".find_child("AnimatedSprite2D").play("laying")
		$"Path2D/catPath/black cat".find_child("onWalk").stop()
		$"Path2D/catPath/black cat".find_child("walkTimer").stop()
		$catSleepTimer.start()


func _on_cat_sleep_timer_timeout():
	$purring.stop()
	$catSleepTimer.stop()
	$"Path2D/catPath/black cat".find_child("AnimatedSprite2D").play("getUp")
	State.catSleeping = false
	


func _on_hunger_btn_mouse_entered():
	$Picture/Img.modulate = Color(1, 0.847, 1)


func _on_hunger_btn_mouse_exited():
	$Picture/Img.modulate = Color(1, 1, 1)


func _on_hunger_btn_input_event(viewport, event, shape_idx):
	if Input.is_action_just_released("leftClick"):
		get_tree().change_scene_to_file("res://scenes/chase_again.tscn")


func _on_dexterity_btn_mouse_entered():
	$"Picture3/LightOnWall-pixelicious(1)".modulate = Color(1, 0.847, 1)


func _on_dexterity_btn_mouse_exited():
	$"Picture3/LightOnWall-pixelicious(1)".modulate = Color(1, 1, 1)


func _on_dexterity_btn_input_event(viewport, event, shape_idx):
	if Input.is_action_just_released("leftClick"):
		get_tree().change_scene_to_file("res://characters/choose_cat.tscn")
