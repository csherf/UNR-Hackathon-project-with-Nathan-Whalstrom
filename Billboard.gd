extends MeshInstance

func _process(delta):
	rotation = get_viewport().get_camera().global_transform.basis.get_euler()


