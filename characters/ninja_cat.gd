extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var enterOnce = false
var enterAnimOnce = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	if State.catOptThree:
		$ak47.play("idle")

func _process(delta):
	if State.catOptOne and !enterOnce:
		enterOnce = false
		$ak47.hide()
		$fireballCat.show()
		$sprite.hide()
	elif State.catOptTwo and !enterOnce:
		enterOnce = false
		$ak47.show()
		$sprite.hide()
		$fireballCat.hide()
	elif State.catOptThree and !enterOnce:
		enterOnce = false
		$ak47.hide()
		$sprite.show()
		$fireballCat.hide()

#
#func _physics_process(delta):
	## Add the gravity.
	#if not is_on_floor():
		#velocity.y += gravity * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction = Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
#
	#move_and_slide()

func _on_sprite_animation_finished():
	$"."/sprite.play("idle")



func _on_ak_47_animation_finished():
	$ak47.play("idle2")


func _on_fireball_cat_animation_finished():
	$fireballCat.play("idle")
