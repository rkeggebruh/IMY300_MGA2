extends Node2D

var rng = RandomNumberGenerator.new()
var count = 0

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
	
