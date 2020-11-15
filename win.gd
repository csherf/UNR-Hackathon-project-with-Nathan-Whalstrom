extends Control

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	MusicController.play("res://tracks/elevator2.wav")

func _on_Button_pressed():
	get_tree().change_scene("res://menu.tscn")
