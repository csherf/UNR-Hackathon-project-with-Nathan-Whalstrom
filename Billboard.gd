extends MeshInstance

func _process(delta):
	if get_viewport().get_camera() != null:
		rotation = get_viewport().get_camera().global_transform.basis.get_euler()


