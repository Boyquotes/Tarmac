extends RigidBody2D


var speed = 200

var turnSpeed = 40
var driftForce = 0.000002

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		apply_torque_impulse(turnSpeed)
		
	if Input.is_action_pressed("ui_left"):
		apply_torque_impulse(-turnSpeed)
		
	if Input.is_action_pressed("ui_up"):
		add_force(Vector2(0,0), returnFront() * speed * delta)
	else:
		return
	addGrip()
		

func addGrip():
	var vectorForward = transform.y * linear_velocity.dot(transform.y)
	var vectorRight = transform.x * linear_velocity.dot(transform.x)
	linear_velocity = vectorForward + vectorRight * driftForce

func returnFront():
	return Vector2(-cos(rotation + PI/2.0), + sin(rotation - PI/2.0))



