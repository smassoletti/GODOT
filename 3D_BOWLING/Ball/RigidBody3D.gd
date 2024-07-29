extends RigidBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var Force = Vector3(0,0,100)
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if(Input.is_action_just_pressed("ui_up")):
		add_constant_force(Force)
		force_update_transform()
