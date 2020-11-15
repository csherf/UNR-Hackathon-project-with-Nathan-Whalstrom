extends Area

var eventTriggered = false
#onready 
#onready 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area_body_entered(body):
	if(!eventTriggered):
		var spookyman = Util.from_group("SpookyGuy", self)
		var player = Util.from_group("Player", self)
		eventTriggered = true
		$eventGUI/Control.visible = true
		spookyman.active = true
		player.get_node("CanvasLayer/outline").visible = true
		player.secondEventTriggered = true
		$Timer.start()

func _on_Timer_timeout():
	$eventGUI/Control.visible = false
	
