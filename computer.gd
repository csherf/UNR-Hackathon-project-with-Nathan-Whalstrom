extends Area

var clicked = false

func _ready():
	#yield(get_tree(), "physics_frame")
	var player = Util.from_group("Player", self)
	if player != null:
		player.computers_left += 1
		player.task_text.text = "- Turn off computers: " + str(player.computers_left)

func click(player):
	if !clicked:
		clicked = true
		$computerOn.visible = false
		$computerOf.visible = true
		MusicController.play("res://tracks/Shutdown Sound.wav")
		player.computers_left -= 1
		if player.computers_left > 0:
			player.task_text.text = "- Turn off computers: " + str(player.computers_left)
		else:
			player.task_text.text = "- Get to the next floor"
			var next_level_door = Util.from_group("NextLevelDoor", self)
			if next_level_door != null:
				next_level_door.open()
