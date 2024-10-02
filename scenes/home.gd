extends Node2D

var rng = RandomNumberGenerator.new()
var count = 0
var insOne = true
var insTwo = false
var insThree = false
var insFour = false
var insFive = false
var insFinal = false

#var newCount = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	
	$hunger.value = State.hungerStatus
	$boredom2.value = State.boredStatus
	$dexterity.value = State.dexterityStatus
	$love.value = State.attentionStatus
	
	GameTImer.find_child("Timer").start()
	
	TrainingSound.find_child("AudioStreamPlayer").stop()
	$"Path2D/catPath/black cat/heart1".hide()
	
	$ColorRect/arr1.hide()
	$ColorRect/arr2.hide()
	$ColorRect/arr3.hide()
	$ColorRect/Arrow.hide()
	$ColorRect/Arrow2.hide()
	$ColorRect/Arrow3.hide()
	$ColorRect/arrowMid.hide()
	$ColorRect/arrowUp.hide()
	$ColorRect/arrowDown.hide()
	$ColorRect/threeArrs2.hide()
	$ColorRect/arrow4.hide()
	$ColorRect/arr4.hide()
	
	if !State.HomeinstructionsDone:
		$ColorRect.show()
		$firstMeow.play()
	if State.HomeinstructionsDone:
		$deplete.start()
		$depleteFood.start()
		$depleteBoredom.start()
		$depleteDexterity.start()
		$getBiggerTimer.start()
		$ColorRect.hide()
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if State.hungerStatus == 0:
		State.gameOver = true
	
	#if State.dexterityStatus < 60:
		#State.catSpeed = 0.04
	#else:
		#State.catSpeed = 0.08
	
	if State.scaleUpdate:
		$"Path2D/catPath/black cat".scale.x += State.catScale
		$"Path2D/catPath/black cat".scale.y += State.catScale
		State.scaleUpdate = false
		#$"Path2D/catPath/black cat".scale *= State.catScale
	
	if !State.HomeinstructionsDone:
		if Input.is_action_just_released("ui_accept") and insOne:
			print("first ins")
			insTwo = true
			insOne = false
			$ColorRect/arr1.show()
			$ColorRect/Arrow.show()
			$ColorRect/Arrow/AnimationPlayer.play("arrow")
			#pass
		elif Input.is_action_just_released("ui_accept") and insTwo:
			insTwo = false
			insThree = true
			$ColorRect/arr1.hide()
			$ColorRect/Arrow.hide()
			$ColorRect/Arrow2.show()
			$ColorRect/arr2.show()
			$ColorRect/Arrow2/AnimationPlayer.play("arrow")
		elif Input.is_action_just_released("ui_accept") and insThree:
			insFour = true
			insThree = false
			$ColorRect/Arrow2.hide()
			$ColorRect/arr2.hide()
			$ColorRect/arr3.show()
			$ColorRect/Arrow3.show()
			$ColorRect/Arrow3/AnimationPlayer.play("arrow")
		elif Input.is_action_just_released("ui_accept") and insFour:
			insFour = false
			insFive = true
			$ColorRect/arr3.hide()
			$ColorRect/Arrow3.hide()
			$ColorRect/arr3.hide()
			$ColorRect/Arrow3.hide()
			$ColorRect/arrow4.show()
			$ColorRect/arrow4/AnimationPlayer.play("knock")
			$ColorRect/arr4.show()
		elif Input.is_action_just_released("ui_accept") and insFive:
			insFive = false
			insFinal = true
			$ColorRect/arrow4.hide()
			$ColorRect/arr4.hide()
			$ColorRect/threeArrs2.show()
			$ColorRect/threeArrs.play("arrow")
			$ColorRect/arrowMid.show()
			$ColorRect/arrowUp.show()
			$ColorRect/arrowDown.show()
			$ColorRect/threeArrs2.show()
		elif Input.is_action_just_released("ui_accept") and insFinal:
			$ColorRect.hide()
			$deplete.start()
			$depleteFood.start()
			$depleteBoredom.start()
			$depleteDexterity.start()
			$getBiggerTimer.start()
			State.HomeinstructionsDone = true


func _on_petting_cat_mouse_entered():
	$love.value += 10
	$heart.play()
	$"Path2D/catPath/black cat/heart1".show()
	$heart1Time.start()

func _on_petting_cat_mouse_exited():
	#$heart1Time.stop()
	pass


func _on_heart_1_time_timeout():
	#print("timer 1")
	$"Path2D/catPath/black cat/heart1".hide()




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
		ClickSound.find_child("AudioStreamPlayer").play()
		get_tree().change_scene_to_file("res://scenes/chase_again.tscn")


func _on_dexterity_btn_mouse_entered():
	$"Picture3/LightOnWall-pixelicious(1)".modulate = Color(1, 0.847, 1)


func _on_dexterity_btn_mouse_exited():
	$"Picture3/LightOnWall-pixelicious(1)".modulate = Color(1, 1, 1)


func _on_dexterity_btn_input_event(viewport, event, shape_idx):
	if Input.is_action_just_released("leftClick"):
		ClickSound.find_child("AudioStreamPlayer").play()
		get_tree().change_scene_to_file("res://characters/choose_cat.tscn")


func _on_get_bigger_timer_timeout():
	#$"Path2D/catPath/black cat".scale.x += 1
	#$"Path2D/catPath/black cat".scale.y += 1
	#var scale_factor = 1.1  # Increase size by 20% each time
	State.scaleUpdate = true
	#$"Path2D/catPath/black cat".scale *= scale_factor
	State.catScale += 1



func _on_boredom_area_mouse_entered():
	$Picture2/pic2.modulate = Color(1, 0.847, 1)


func _on_boredom_area_mouse_exited():
	$Picture2/pic2.modulate = Color(1, 1, 1)


func _on_boredom_area_input_event(viewport, event, shape_idx):
	if Input.is_action_just_released("leftClick"):
		ClickSound.find_child("AudioStreamPlayer").play()
		get_tree().change_scene_to_file("res://scenes/node_2d.tscn")



func _on_deplete_timeout():
	$love.value -= 10
	State.attentionStatus = $love.value


func _on_deplete_food_timeout():
	$hunger.value -= 10
	State.hungerStatus = $hunger.value


func _on_deplete_boredom_timeout():
	$boredom2.value -= 10
	State.boredStatus = $boredom2.value


func _on_deplete_dexterity_timeout():
	$dexterity.value -= 10
	State.dexterityStatus = $dexterity.value


#var boredStatus = 100
#var attentionStatus = 100
#var dexterityStatus = 100
#var hungerStatus = 100
