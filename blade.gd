extends CharacterBody3D

var gravity = 70
var friccion = 0.2

func _physics_process(delta):
	var vector = Vector3(0,0,0)
	if Input.is_action_pressed("ui_up"):
		vector.x = 1
	if Input.is_action_pressed("ui_down"):
		vector.x = -1
	if Input.is_action_pressed("ui_right"):
		vector.z = 1
	if Input.is_action_pressed("ui_left"):
		vector.z = -1
	
	var new_velocity_x = clamp((vector.x * 5) + velocity.x, -15, 15)
	var new_velocity_z = clamp((vector.z * 5) + velocity.z, -15, 15)
	
	if new_velocity_x > 0:
		new_velocity_x = new_velocity_x - friccion
	if new_velocity_x < 0:
		new_velocity_x = new_velocity_x + friccion
		
	if new_velocity_z > 0:
		new_velocity_z = new_velocity_z - friccion
	if new_velocity_z < 0:
		new_velocity_z = new_velocity_z + friccion
		
	velocity.x = new_velocity_x
	velocity.z = new_velocity_z
	
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	var collided := move_and_slide()
	if collided and not get_floor_normal():
		var slide_direction := get_last_slide_collision().get_normal()
		velocity = velocity.slide(slide_direction)
