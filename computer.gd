extends Area

var clicked = false

func click(player):
	if !clicked:
		clicked = true
		$computerOn.visible = false
		$computerOf.visible = true
		player.computers_left -= 1
