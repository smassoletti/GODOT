extends Node2D

var top_bar = TextureProgressBar

var accumulate_x = 0
var accumulate_y = 0
var sound_node
var sound_index = 1
var speed_accumulator = 50
var force_x = 0
var force_y = 0 

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
		
		$CharacterBody2D.velocity.x += accumulate_x
		$CharacterBody2D.velocity.y += accumulate_y
		accumulate_x = 0
		accumulate_y = 0
		$CharacterBody2D.move_and_slide()
		
		if $CharacterBody2D. ():
			$CharacterBody2D.velocity.x -= $CharacterBody2D.velocity.x/2

			# Play a random bounce sound
			#sound_node = get_node("Boing" + str(sound_index + 1))
			#sound_node.stop()
			#sound_index = (sound_index + 1) % 7  # Generate a random number between 0 and 6
			#sound_node = get_node("Boing" + str(sound_index + 1))
			#sound_node.play()
	
	$CharacterBody2D.velocity.x -= $CharacterBody2D.velocity.x * delta
	$CharacterBody2D.velocity.y -= $CharacterBody2D.velocity.y * delta
