extends RigidBody3D

@onready var impactSound = $ImpactSound;
var previousCollisions = 0;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if(get_contact_count() > previousCollisions and !impactSound.playing):
		impactSound.volume_db = -30 + linear_velocity.length();
		impactSound.play();
	
	previousCollisions = get_contact_count();
