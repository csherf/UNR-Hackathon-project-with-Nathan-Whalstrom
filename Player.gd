extends KinematicBody

const UP = Vector3(0, 1.0, 0)

export var sprint_speed = 3
export var speed = 1.7
export var look_speed = 0.5 / 9000.0
onready var sprint_resource = $CanvasLayer/outline/background/resource_bar

var sprinting = false

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event is InputEventMouseMotion:
		rotation_degrees.y -= event.relative.x * OS.get_real_window_size().x * look_speed

func _physics_process(delta):
	var move = Vector3.ZERO
	var sprinting = false
	if Input.is_action_pressed("move_forward"):
		move += transform.basis.z
	elif Input.is_action_pressed("move_backward"):
		move -= transform.basis.z
	if Input.is_action_pressed("move_right"):
		move -= transform.basis.x
	elif Input.is_action_pressed("move_left"):
		move += transform.basis.x
	sprinting = Input.is_action_pressed("sprint")
	if sprinting:
		if (sprint_resource.rect_scale.x > 0):
			sprint_resource.rect_scale.x -= .01
			move_and_slide(move * sprint_speed, UP)
	else:
		if (sprint_resource.rect_scale.x < 1):
			sprint_resource.rect_scale.x += .01
		move_and_slide(move * speed, UP)
	

