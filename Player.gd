extends KinematicBody

const UP = Vector3(0, 1.0, 0)

export var sprint_speed = 4
export var speed = 1.7
export var look_speed = 0.5 / 9000.0
onready var spookyman = Util.from_group("SpookyGuy", self)
onready var sprint_resource = $CanvasLayer/outline/background/resource_bar
onready var task_text = $CanvasLayer/Tasks/task
var tired = false
var secondEventTriggered = false
var sprinting = false


var computers_left = 0

##chads comment

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event is InputEventMouseMotion:
		rotation_degrees.y -= event.relative.x * OS.get_real_window_size().x * look_speed

func _physics_process(delta):
	
	if Input.is_action_just_pressed("click"):
		print_debug("click")
		var clickable = $Camera/ClickRay.get_collider()
		if clickable != null:
			print_debug("wow")
			clickable.click(self)
	
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
	if (sprint_resource.rect_scale.x <= 0):
		tired = true
		$Timer.start()
		
	if (sprint_resource.rect_scale.x > 0 && sprinting && !tired && secondEventTriggered):
			sprint_resource.rect_scale.x -= .01
			move_and_slide(move * sprint_speed, UP)
	else:
		if (sprint_resource.rect_scale.x < 1):
			sprint_resource.rect_scale.x += .005
		move_and_slide(move * speed, UP)
	

func _on_Timer_timeout():
	tired = false

# cool beans
