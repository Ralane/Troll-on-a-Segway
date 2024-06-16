extends Area3D

func _process(delta):
	for child in get_overlapping_bodies():
		child.queue_free();
