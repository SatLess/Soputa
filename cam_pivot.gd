extends SpringArm3D
@onready var camera: Camera3D = $Camera3D
@export var mouse_sensitivity: float = 0.001

func _ready() -> void:
	Input.mouse_mode =Input.MOUSE_MODE_CAPTURED

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		_move_to_mouse(event)
	if Input.is_action_just_pressed("ui_cancel"): Input.mouse_mode =Input.MOUSE_MODE_VISIBLE

func _move_to_mouse(event: InputEventMouseMotion) -> void:
	rotate_y(-event.relative.x * mouse_sensitivity)
	camera.rotate_x(-event.relative.y * mouse_sensitivity)
	camera.rotation.x = clampf(camera.rotation.x,-.6,.5)
