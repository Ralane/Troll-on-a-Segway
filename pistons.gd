extends Node3D

@export var crushAnimation = "crush"

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play(crushAnimation);
