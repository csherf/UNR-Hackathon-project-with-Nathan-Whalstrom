extends Spatial
onready var scene1 = Util.from_group("level", self)
export (PackedScene) var scene 

func open():
	$Door.translation += Vector3(0, 20, 0)

func _on_Next_body_entered(body):
	print_debug("next floor")
	scene1.get_parent().add_child(scene.instance())
	scene1.queue_free()
	
