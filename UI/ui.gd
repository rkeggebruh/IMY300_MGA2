extends CanvasLayer

#var menuShow = true

# Called when the node enters the scene tree for the first time.
func _ready():
	#Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$pauseMenu.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_cog_area_mouse_entered():
	$AnimationPlayer.play("spin")


func _on_cog_area_input_event(viewport, event, shape_idx):
	if Input.is_action_just_released("leftClick") and !State.menuShow:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		State.menuShow = true
		State.onPause = true
		$pauseMenu.show()
