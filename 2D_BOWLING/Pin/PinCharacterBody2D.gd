extends CharacterBody2D


var collision_info = false

# Called when the node enters the scene tree for the first time.
func _ready():
	

	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_and_slide()
	print(velocity)
	pass

func _physics_process(delta):

	collision_info = move_and_collide(velocity * delta)
	
	if collision_info:
		#velocity = velocity.bounce(collision_info.get_normal())
		print(velocity)
		velocity = velocity.bounce(collision_info.get_collider().get_normal())
		velocity.x = -velocity.x
		velocity.y = -velocity.y
		#move_and_collide(velocity * delta)
		# velocity.x -= velocity.x/2
		# velocity.y -= velocity.y/2
		# Play a random bounce sound
		#sound_node = get_node("Boing" + str(sound_index + 1))
		#sound_node.stop()
		#sound_index = (sound_index + 1) % 7  # Generate a random number between 0 and 6
		#sound_node = get_node("Boing" + str(sound_index + 1))
		#sound_node.play()
	
	#velocity.x -= velocity.x * delta
	#velocity.y -= velocity.y * delta


	pass

