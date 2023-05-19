extends Sprite


func _physics_process(delta):
	if Input.is_action_pressed("left"):
		rotation = -10
	elif Input.is_action_pressed("right"):
		rotation = 10
	else:
		rotation = 0
