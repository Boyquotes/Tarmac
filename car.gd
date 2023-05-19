extends KinematicBody2D


var _rotation = 0
var steering = 200
var turningThreshold = 1600

var acceleration = 400
var deacceleration = 1800
var speed = 0

var topSpeed = 120000

var _vector = Vector2()

signal raceData

var time = 0

var laps = 0

func _ready():
	Engine.set_target_fps(Engine.get_iterations_per_second())

func _physics_process(delta):
	time += delta
	if Input.is_action_pressed("ui_right") and _vector.length() > turningThreshold:
		_rotation += deg2rad(steering * (1 - (_vector.length() / topSpeed) + 0.5))
		
	if Input.is_action_pressed("ui_left") and _vector.length() > turningThreshold:
		_rotation -= deg2rad(steering * (1 - (_vector.length() / topSpeed) + 0.5))
		
	if Input.is_action_pressed("ui_up") and _vector.length() <  topSpeed:
		speed += acceleration
	
	elif _vector.length() > deacceleration:
		speed -= deacceleration

	rotation = deg2rad(_rotation)
	_vector = transform.y * speed
	
	move_and_slide(_vector * delta)
	
func _on_Area2D_body_entered(body):
	emit_signal("raceData", time, laps)
	print(str(time) + " on lap " + str(laps))
	time = 0
	laps += 1
	
	

	
	

	
















	
#func returnFront():
#	return Vector2(-cos(rotation + PI/2.0), + sin(rotation - PI/2.0))
#
#func returnRightVector(vector):
#	return Vector2(-vector.y, vector.x)
#
#func returnDriftVelocity():
#	var rightVelocity = transform.y * returnFront().dot(transform.x)
#	return returnFront() + rightVelocity * driftFactor



#	for index in get_slide_count():
#		var collision = get_slide_collision(index)
#		if collision.collider.name == "timingGate":
#			print("timing gate has been passed")
#
##	var info = move_and_collide(_vector * delta)
##
##	if info:
##		var object = info.get_collider()
##		if object.name == "timingGate":
##			print("gate has been passed")

