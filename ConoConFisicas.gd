extends RigidBody3D

func _integrate_forces (state):
	var vector = Vector3(0,0,0)
	if Input.is_action_pressed("ui_up"):
		vector.x = 1
	if Input.is_action_pressed("ui_down"):
		vector.x = -1
	if Input.is_action_pressed("ui_right"):
		vector.z = 1
	if Input.is_action_pressed("ui_left"):
		vector.z = -1
	state.apply_force(vector * 100)
