extends RigidBody3D


const SPEED = 20.0
var ACCUMULATOR = 0.0
const SLIDE = 10

var Force_Left = Vector3(SPEED,0,0)
var Force_Right = Vector3(-SPEED,0,0)

func _physics_process(delta):
	# Add the gravity.
	$"../Sprite3D/SubViewport/ProgressBar".max_value = mass * 2
	if(Input.is_action_pressed("ui_up")):
		if ACCUMULATOR < $"../Sprite3D/SubViewport/ProgressBar".max_value:
			ACCUMULATOR += SPEED*delta

		
	if(Input.is_action_just_released("ui_up")):
		if ACCUMULATOR < mass:
			ACCUMULATOR = 110
		add_constant_force(Vector3(0,0,ACCUMULATOR*mass))
		ACCUMULATOR = 0
		force_update_transform()
		$"../Sprite3D/SubViewport/ProgressBar".visible = false
		
	if(Input.is_action_just_released("ui_down")):
		add_constant_force(Vector3(0,0,-SPEED))
		force_update_transform()
	
			
	if(Input.is_action_pressed("ui_left")):
		position.x += SLIDE*delta
		$"../Sprite3D".position.x += SLIDE*delta
	if(Input.is_action_pressed("ui_right")):
		position.x -= SLIDE*delta
		$"../Sprite3D".position.x -= SLIDE*delta
		
	$"../Sprite3D/SubViewport/ProgressBar".value = ACCUMULATOR
	
	
	
