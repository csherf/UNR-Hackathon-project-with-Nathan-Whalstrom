extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var _player = $AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
#func _ready():
#	play("res://tracks/elevator music.wav") # Replace with function body.

func play(track_url : String):
	stop()
	var new_track = load(track_url)
	_player.stream = new_track
	_player.play()
func stop():
	_player.stop()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
