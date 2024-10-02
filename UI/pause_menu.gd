extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_resume_pressed():
	State.menuShow = false
	$".".hide()


func _on_exit_to_main_pressed():
	ClickSound.find_child("AudioStreamPlayer").play()
	get_tree().change_scene_to_file("res://scenes/menu.tscn")


func _on_options_pressed():
	ClickSound.find_child("AudioStreamPlayer").play()
	get_tree().change_scene_to_file("res://scenes/home.tscn")
