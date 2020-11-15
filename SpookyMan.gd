extends Area

const UP = Vector3(0, 1.0, 0)

export var look_offset = Vector3(0, 1.75, 0);
export var move_speed = 2.0
var active = false
var target = Vector3.ZERO

func _physics_process(delta):
	if(active): 
		var move = Vector3.ZERO
		
		var player = Util.from_group("Player", self)
		var nav = Util.from_group("MainNav", self)
		if nav != null:
			
			if get_world().direct_space_state.intersect_ray(translation + look_offset, player.translation + look_offset, [self], collision_mask):
				if (target - translation).length() < move_speed * delta:
					var waypoints = get_tree().get_nodes_in_group("Waypoint")
					if waypoints.size() > 0:
						target = waypoints[randi() % waypoints.size()]
			elif player != null:
				target = player.translation
				
			var path = nav.get_simple_path(translation, target)
			for i in range(path.size()):
				if (path[i] - translation).length() > move_speed * delta:
					move = (path[i] - translation).normalized() * move_speed
					break
				
		translation += move * delta
		


func _on_Anim_timeout():
	$Billboard.scale.x *= -1


func _on_SpookyMan_body_entered(body):
	$CanvasLayer/Control/Jumpscare.visible = true
