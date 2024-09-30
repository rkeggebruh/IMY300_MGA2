extends Node2D

var insOne = true

# Called when the node enters the scene tree for the first time.
func _ready():
	$ColorRect.show()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and insOne:
		insOne = false
		$ColorRect.hide()
	elif !insOne:
		if Input.is_action_just_released("ui_down"):
			if State.catOptOne:
				$ninjaCat/fireballCat.play("firePunch2")
			elif State.catOptTwo:
				$ninjaCat/ak47.play("playDead")
			elif State.catOptThree:
				$ninjaCat/sprite.play("flipKick")
			#$ninjaCat/sprite.play("flipKick")
			$down.play("clicked")
		
		if Input.is_action_just_released("ui_up"):
			if State.catOptOne:
				$ninjaCat/fireballCat.play("fireballHorizontalUp")
			elif State.catOptTwo:
				$ninjaCat/ak47.play("jumpShoot")
			elif State.catOptThree:
				$ninjaCat/sprite.play("uppercut")
			#$up.play("clicked")
			$ninjaCat/sprite.play("uppercut")
		
		if Input.is_action_just_released("ui_left"):
			if State.catOptOne:
				$ninjaCat/fireballCat.play("fireSpin")
			elif State.catOptTwo:
				$ninjaCat/ak47.play("shoot")
			elif State.catOptThree:
				$ninjaCat/sprite.play("punch")
			#$ninjaCat/sprite.play("punch")
			$left.play("clicked")
		
		if Input.is_action_just_released("ui_accept"):
			if State.catOptOne:
				$ninjaCat/fireballCat.play("fireKick")
			elif State.catOptTwo:
				$ninjaCat/ak47.play("flipKick")
			elif State.catOptThree:
				$ninjaCat/sprite.play("kick")
			#$ninjaCat/sprite.play("kick")
			$space.play("clicked")
		
		if Input.is_action_just_released("ui_right"):
			if State.catOptOne:
				$ninjaCat/fireballCat.play("handMove")
			elif State.catOptTwo:
				$ninjaCat/ak47.play("flipKick")
			elif State.catOptThree:
				$ninjaCat/sprite.play("roundKick")
			#$ninjaCat/sprite.play("roundKick")
			$right.play("clicked")
			



func _on_down_animation_finished():
	$down.play("default")


func _on_up_animation_finished():
	#$ninjaCat/sprite.play("uppercut")
	$up.play("default")


func _on_left_animation_finished():
	#$ninjaCat/sprite.play("punch")
	$left.play("default")


func _on_space_animation_finished():
	#$ninjaCat/sprite.play("kick")
	$space.play("default")


func _on_right_animation_finished():
	$right.play("default")
