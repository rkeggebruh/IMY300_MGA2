extends Node2D

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	$heart1.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
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
	print("timer 1")
	$heart1.hide()


