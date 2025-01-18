extends CharacterBody3D

@onready var cam_pivot: SpringArm3D = $CamPivot

const SPEED = 10.0
const JUMP_VELOCITY = 4.5


func _physics_process(delta: float) -> void:
	_move()

func _move():
	var input_dir := Input.get_vector("strafe_left", "strafe_right", "foward", "backward")
	var direction := (cam_pivot.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
