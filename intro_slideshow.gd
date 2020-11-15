extends Control

export (PackedScene) var scene

var i = 0

func _process(delta):
	if Input.is_action_just_pressed("click"):
		i += 1
		if i == 1:
			$s0.visible = false
		elif i == 2:
			$s1.visible = false
		else:
			get_tree().change_scene_to(scene)
