extends Area

const UP = Vector3(0, 1.0, 0)

export var move_speed = 5.0

func _physics_process(delta):
	
	var move = Vector3.ZERO
	
	var player = Util.from_group("Player", self)
	var nav = Util.from_group("MainNav", self)
	if nav != null and player != null:
		var path = nav.get_simple_path(translation, player.translation, false)
		for i in range(path.size() - 1):
			if (path[i + 1] - translation).length() > move_speed * delta:
				move = (path[i + 1] - translation).normalized() * move_speed
				print_debug(i)
			
	translation += move * delta
		


func _on_Anim_timeout():
	$Billboard.scale.x *= -1
