extends VehicleBody3D

var horsepower = 2000

var steer_limit = deg_to_rad(30)

func _physics_process(delta):
	var move_input = Input.get_action_strength("accelerate")
	engine_force = move_input * horsepower

	var turn_input = Input.get_action_strength("steer_left") -  Input.get_action_strength("steer_right")
	steering = turn_input * steer_limit
