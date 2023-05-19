extends Line2D


var point

func _ready():
	set_as_toplevel(true)


func _process(delta):
	point = get_parent().position
	add_point(point)
	if points.size() > 100:
		remove_point(0)
