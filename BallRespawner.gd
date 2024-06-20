extends Node3D

var bowlingBall = preload("res://bowling_ball.tscn");

var time_per_ball = 1.4;
var time_alive = 0.0;

var ballCount = 0;

func _ready():
	time_alive += randf();

func _process(delta):
	time_alive += delta;
	position.z = sin(time_alive) * 48
	if(ballCount < time_alive / time_per_ball):
		ballCount += 1;
		var ball = bowlingBall.instantiate();
		add_child(ball);
		ball.top_level = true;
		ball.global_position = $MeshInstance3D.global_position;
