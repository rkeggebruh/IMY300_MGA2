extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$fireball.hide()
	$fireSingleHand.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $".".animation == "fireballHorizontalUp" and $".".frame == 6:
		$fireball.show()
		$fireSingleHand.hide()
		$fireball.play("fireballUp")
	
	if $".".animation == "firePunch2" and $".".frame == 3:
		$fireball.hide()
		$fireSingleHand.show()
		$fireSingleHand.play("default")




func _on_fireball_animation_finished():
	$fireball.hide()
	$fireSingleHand.hide()


func _on_fire_single_hand_animation_finished():
	$fireball.hide()
	$fireSingleHand.hide()
