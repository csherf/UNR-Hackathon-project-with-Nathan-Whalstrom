extends KinematicBody

const UP = Vector3(0, 1.0, 0)

export var move_speed = 5.0

func _physics_process(delta):
	
	var move = Vector3.ZERO
	
	var player = Util.from_group("Player", self)
	var nav = Util.from_group("MainNav", self)
	if nav != null and player != null:
		var path = nav.get_simple_path(translation, player.translation)
		if path.size() >= 2:
			move = (path[1] - translation).normalized() * move_speed
	move_and_slide(move, UP)
		
