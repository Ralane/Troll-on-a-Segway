extends VehicleBody3D

var horsepower = 2000

var steer_limit = deg_to_rad(45)

func _physics_process(delta):
	var move_input = Input.get_action_strength("accelerate")
	engine_force = lerpf(engine_force, move_input * horsepower, delta * 10);

	var turn_input = Input.get_action_strength("steer_left") -  Input.get_action_strength("steer_right")
	steering = lerpf(steering, turn_input * steer_limit, delta * 5);
