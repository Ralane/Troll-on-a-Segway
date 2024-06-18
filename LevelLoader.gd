extends Button

@export var levelToLoad: String;

func _pressed():
	get_tree().change_scene_to_file(levelToLoad)
