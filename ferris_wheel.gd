extends AnimatableBody3D

var time = 0;
var distance = 50;
var timeScale = 0.12;
@export var offset = 0.0;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = Vector3(position.x, distance * cos(time * timeScale + offset * PI), distance * sin(time * timeScale + offset * PI));
	time += delta;
