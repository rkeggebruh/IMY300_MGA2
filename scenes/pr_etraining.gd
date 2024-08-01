extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_released("ui_down"):
		$ninjaCat/sprite.play("flipKick")
		$down.play("clicked")
	
	if Input.is_action_just_released("ui_up"):
		$up.play("clicked")
		$ninjaCat/sprite.play("uppercut")
	
	if Input.is_action_just_released("ui_left"):
		$ninjaCat/sprite.play("punch")
		$left.play("clicked")
	
	if Input.is_action_just_released("ui_accept"):
		$ninjaCat/sprite.play("kick")
		$space.play("clicked")
	
	if Input.is_action_just_released("ui_right"):
		$ninjaCat/sprite.play("roundKick")
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
