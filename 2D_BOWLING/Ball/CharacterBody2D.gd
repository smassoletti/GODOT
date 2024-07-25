extends CharacterBody2D

var accumulate_x = 0
var accumulate_y = 0
var sound_node
var sound_index = 1
var speed_accumulator = 5
var collision_info = false

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	if Input.is_action_pressed("Left"):
		accumulate_x -= speed_accumulator
		
	if Input.is_action_pressed("Right"):
		accumulate_x += speed_accumulator
		
	if Input.is_action_pressed("Up"):
		accumulate_y -= speed_accumulator

	
	if Input.is_action_pressed("Down"):
		accumulate_y += speed_accumulator
		
	if !(Input.is_action_pressed("Up") || Input.is_action_pressed("Down") || Input.is_action_pressed("Left") || Input.is_action_pressed("Right")):
		velocity.x = velocity.x + accumulate_x
		velocity.y = velocity.y + accumulate_y
		accumulate_x = 0
		accumulate_y = 0

	
func _physics_process(delta):
	collision_info = move_and_collide(velocity * delta)
	if collision_info:
		velocity = velocity.bounce(collision_info.get_normal())
		# velocity.x -= velocity.x/2
		# velocity.y -= velocity.y/2
		# Play a random bounce sound
		#sound_node = get_node("Boing" + str(sound_index + 1))
		#sound_node.stop()
		#sound_index = (sound_index + 1) % 7  # Generate a random number between 0 and 6
		#sound_node = get_node("Boing" + str(sound_index + 1))
		#sound_node.play()
	
	velocity.x -= velocity.x * delta
	velocity.y -= velocity.y * delta


	pass
