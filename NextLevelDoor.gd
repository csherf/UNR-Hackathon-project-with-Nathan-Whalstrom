extends Spatial

func open():
	$Door.translation += Vector3(0, 20, 0)

func _on_Next_body_entered(body):
	print_debug("next floor")
