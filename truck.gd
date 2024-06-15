extends RigidBody3D

@onready var gnomes = preload("res://multi_gnomes.tscn");

@onready var checkpointShow = $ShowCheckpoint;
@onready var fireworks = $CPUParticles3D;

@onready var babyCounter = $BabyCounter;
@onready var babiesOnBoard = $BabiesOnBoard;

func _on_area_3d_area_entered(area):
	var gnewGnomes = gnomes.instantiate();
	area.queue_free();
	for child in gnewGnomes.get_children():
		child.linear_velocity = self.linear_velocity;
	$MultiGnomeSpawner.add_child(gnewGnomes);
	
	fireworks.restart();
	checkpointShow.play("checkpoint");

func _process(delta):
	babiesOnBoard.text = "troll     babis     on      bord:\n" + str(babyCounter.get_overlapping_bodies().size());
