extends AnimatedSprite3D

var camera: Camera3D

func _ready() -> void:
	#dont forget that the player must be initialized first
	camera = get_viewport().get_camera_3d()

func _process(delta: float) -> void:
	_adjust_sprite_to_camera()

func _adjust_sprite_to_camera():
	var p_fwd := -camera.global_basis.z
	var fwd := transform.basis.z
	var left := transform.basis.x
	
	var l_dot = left.dot(p_fwd)
	var f_dot = fwd.dot(p_fwd)
	
	if f_dot > .95:
		play("front")
	elif  f_dot < -.85:
		play("backward")
