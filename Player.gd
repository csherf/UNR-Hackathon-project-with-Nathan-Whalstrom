extends KinematicBody

const UP = Vector3(0, 1.0, 0)

export var speed = 10.0
export var look_speed = 0.5 / 1200.0

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event is InputEventMouseMotion:
		rotation_degrees.y -= event.relative.x * OS.get_real_window_size().x * look_speed

func _physics_process(delta):
	var move = Vector3.ZERO
	if Input.is_action_pressed("move_forward"):
		move += transform.basis.z
	elif Input.is_action_pressed("move_backward"):
		move -= transform.basis.z
	if Input.is_action_pressed("move_right"):
		move -= transform.basis.x
	elif Input.is_action_pressed("move_left"):
		move += transform.basis.x
	move_and_slide(move * speed, UP);
