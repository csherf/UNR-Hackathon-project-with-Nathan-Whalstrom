extends Area

var eventTriggered = false

func _on_Area_body_entered(body):
	if(!eventTriggered):
		var spookyman = Util.from_group("SpookyGuy", self)
		var player = Util.from_group("Player", self)
		eventTriggered = true
		$eventGUI/Control.visible = true
		spookyman.active = true
		player.get_node("CanvasLayer/outline").visible = true
		player.secondEventTriggered = true
		MusicController.play("res://tracks/creep sound2.wav")
		MusicController.increaseVol()
		$Timer.start()

func _on_Timer_timeout():
	$eventGUI/Control.visible = false
	
