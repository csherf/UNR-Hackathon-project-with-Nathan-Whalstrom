extends Node


export (PackedScene) var scene 



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_startButton_pressed():
	get_parent().add_child(scene.instance())
	queue_free()

func _on_quitButton_pressed():
	get_tree().quit()
