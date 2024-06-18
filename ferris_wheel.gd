extends AnimatableBody3D

var time = 0;
var distance = 50;
var timeScale = 0.03;
@export var offset = 0.0;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.z = distance * sin(time * timeScale + offset * PI);
	position.y = distance * cos(time * timeScale + offset * PI);
	time += delta;
