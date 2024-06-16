extends RigidBody3D

@onready var gnomes = preload("res://multi_gnomes.tscn");

@onready var checkpointShow = $ShowCheckpoint;
@onready var fireworks = $CPUParticles3D;

@onready var babyCounter = $BabyCounter;
@onready var babiesOnBoard = $BabiesOnBoard;

var lastBabyCount = 0;

func _on_area_3d_area_entered(area):
	var gnewGnomes = gnomes.instantiate();
	area.queue_free();
	for child in gnewGnomes.get_children():
		child.linear_velocity = self.linear_velocity;
	$MultiGnomeSpawner.add_child(gnewGnomes);
	
	fireworks.restart();
	checkpointShow.play("checkpoint");

func _physics_process(delta):
	babiesOnBoard.text = "troll babis on bord:\n" + str(babyCounter.get_overlapping_bodies().size());
	if(babyCounter.get_overlapping_bodies().size() == 0):
		babiesOnBoard.modulate = Color.DARK_RED
		checkpointShow.play("gameOverCntdown");
	elif(lastBabyCount == 0):
		checkpointShow.play("RESET")
		babiesOnBoard.modulate = Color.WHITE;

	lastBabyCount = babyCounter.get_overlapping_bodies().size();

func failure():
	get_tree().reload_current_scene();


func win():
	get_tree().change_scene_to_file(get_parent_node_3d().nextLevelToLoad)


func _on_win_detector_area_entered(area):
	checkpointShow.play("gameWin");
