extends RigidBody3D

var time = 0;
var distance = 32;
var timeScale = 0.2;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x = distance * sin(time * timeScale);
	time += delta;
