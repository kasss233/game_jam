extends  Control
@export var world:PackedScene

func _on_button_pressed() -> void:
	#get_tree().change_scene_to_packed(world)
	SceneChanger.change_scene(world)