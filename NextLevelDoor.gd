extends Spatial
export (PackedScene) var scene 

func open():
	$Door.translation += Vector3(0, 20, 0)

func _on_Next_body_entered(body):
	get_tree().change_scene_to(scene)
	
