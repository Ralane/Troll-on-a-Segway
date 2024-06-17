extends VehicleBody3D

var horsepower = 1600

var steer_limit = deg_to_rad(45)

@onready var steeringStickModel = $CSGCombiner3D/SteeringStick;
@onready var raycast3D = $RayCast3D;

@onready var idleSounds = $MotorSounds;

func _physics_process(delta):
	var move_input = Input.get_action_strength("accelerate") - Input.get_action_strength("reverse") / 1.5
	engine_force = lerpf(engine_force, move_input * horsepower, delta * 8);

	var turn_input = Input.get_action_strength("steer_left") -  Input.get_action_strength("steer_right")
	steering = lerpf(steering, turn_input * steer_limit, delta * 2);

	$CameraFollower.rotation_degrees.y = steering * 45;
	steeringStickModel.rotation_degrees.y = steering * 45	

	idleSounds.pitch_scale = 0.7 + absf(engine_force * 0.001);
	idleSounds.volume_db = -8 + absf(engine_force * 0.001);
