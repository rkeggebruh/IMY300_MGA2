extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(str($Timer.time_left))
	if State.tenMins and State.timerUpdated:
		State.timerUpdated = false
		$Timer.wait_time = 600
	if State.twentyMins and State.timerUpdated:
		State.timerUpdated = false
		$Timer.wait_time = 1200
	if State.thirtyMins and State.timerUpdated:
		State.timerUpdated = false
		$Timer.wait_time = 1800
	if State.foreverMins and State.timerUpdated:
		State.timerUpdated = false
		$Timer.wait_time = 3000


func _on_timer_timeout():
	$Timer.stop()
	print("----------- GAME FINISHED -------------")
