extends Node


export (PackedScene) var scene 


func _ready():
	pass


func _on_startButton_pressed():
	get_parent().add_child(scene.instance())
	queue_free()

func _on_quitButton_pressed():
	get_tree().quit()
