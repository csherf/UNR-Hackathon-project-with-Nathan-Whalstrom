extends Node


export (PackedScene) var scene 


func _ready():
	MusicController.play("res://tracks/elevator2.wav")


func _on_startButton_pressed():
	get_tree().change_scene_to(scene)

func _on_quitButton_pressed():
	get_tree().quit()
