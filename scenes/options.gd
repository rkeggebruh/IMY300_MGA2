extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass





func _on_tenmis_pressed():
	State.timerUpdated = true
	$".".hide()
	State.tenMins = true
	State.twentyMins = false
	State.thirtyMins = false
	State.foreverMins = false


func _on_twentmins_pressed():
	State.timerUpdated = true
	$".".hide()
	State.tenMins = false
	State.twentyMins = true
	State.thirtyMins = false
	State.foreverMins = false


func _on_thirtymins_pressed():
	State.timerUpdated = true
	$".".hide()
	State.tenMins = false
	State.twentyMins = false
	State.thirtyMins = true
	State.foreverMins = false


func _on_forever_pressed():
	State.timerUpdated = true
	$".".hide()
	State.tenMins = false
	State.twentyMins = false
	State.thirtyMins = false
	State.foreverMins = true
