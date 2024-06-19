extends RigidBody3D

var time_alive = 0;

func _process(delta):
	time_alive += delta;
	if(time_alive > 45):
		call_deferred("queue_free");

func _ready():
	var matClone = $MeshInstance3D.get_active_material(0).duplicate();
	matClone.albedo_color = Color.from_hsv(randf_range(0.0, 6.0), 1.0, 1.0);
	$MeshInstance3D.set_surface_override_material(0, matClone)

