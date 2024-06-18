extends Node3D
@export var levelToLoad: String;

func _on_area_3d_area_entered(area):
	get_tree().change_scene_to_file(levelToLoad)
