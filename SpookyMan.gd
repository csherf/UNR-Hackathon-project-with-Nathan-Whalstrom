extends Area

const UP = Vector3(0, 1.0, 0)

export var look_offset = Vector3(0, 1.75, 0);
export var move_speed = 2.0
export var tax_fraud_power = 500.0
export var tax_cooldown = 0.5

onready var reset_copy = Util.from_group("level", self).duplicate(DUPLICATE_USE_INSTANCING)

var active = false
var target = Vector3.ZERO

var tax_fraud = false
var tax_fraud_intensity = 1.0

func _process(delta):
	if tax_fraud:
		$CanvasLayer/Control/Jumpscare2.rect_position = tax_fraud_intensity * tax_fraud_power * Vector2(randf() - 0.5, randf() - 0.5)
		tax_fraud_intensity -= delta * tax_cooldown
		if tax_fraud_intensity < 0:
			tax_fraud_intensity = 0

func _physics_process(delta):
	if(active): 
		var move = Vector3.ZERO
		
		var player = Util.from_group("Player", self)
		var nav = Util.from_group("MainNav", self)
		if nav != null:
			
			if get_world().direct_space_state.intersect_ray(translation + look_offset, player.translation + look_offset, [self], 1):
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
	$Billboard.visible = false
	active = false
	$Timer.start()


func _on_Timer_timeout():
	$CanvasLayer/Control/Jumpscare.visible = false
	$CanvasLayer/Control/Jumpscare2.visible = true
	tax_fraud = true
	$Exit_timer.start()


func _on_Exit_timer_timeout():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$CanvasLayer/gameover.visible = true


func _on_Button_pressed():
	get_tree().reload_current_scene()
	
