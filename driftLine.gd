extends Line2D


var startPos

func _physics_process(delta):
	startPos = position
	add_point(startPos)
	if points.size() > 100:
		remove_point(0)
