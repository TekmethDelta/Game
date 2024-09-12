extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -1400
##ProjectSettings.get_setting("physics/2d/default_gravity")
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")*6
var curr_jump_v = JUMP_VELOCITY
var size = 1

var can_change_size = true

@onready var anim = get_node("AnimationPlayer")
func make_big():
	size=1
	gravity = ProjectSettings.get_setting("physics/2d/default_gravity")*6
	curr_jump_v = JUMP_VELOCITY
	scale.x=2
	scale.y=2
	
	
func make_small():
	size=0
	gravity = ProjectSettings.get_setting("physics/2d/default_gravity")/2
	curr_jump_v = -170
	scale.x=1
	scale.y=1

	

	
func _physics_process(delta):
	if can_change_size==true:
		if Input.is_action_just_pressed("ui_down"):
			make_small()
				
		if Input.is_action_just_pressed("ui_up"):
			make_big()
		
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta


	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = curr_jump_v
		pass

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction==-1:
		get_node("Sprite2D").flip_h = true
	elif direction==1:
		get_node("Sprite2D").flip_h= false
	if direction:
		velocity.x = direction * SPEED
		if velocity.y==0:
			pass
			
	
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if velocity.y==0 and velocity.x==0:
			pass

	if velocity.y>0:
		pass


	move_and_slide()






	






func _on_dark_body_entered(_body):
	make_small()
	can_change_size = false


func _on_dark_body_exited(_body):
	can_change_size = true


func _on_light_body_entered(_body):
	make_big()
	can_change_size = false


func _on_light_body_exited(_body):
	can_change_size = true





	


func _on_spike_body_entered(_body):
	position.x =3350
	position.y = 490
	velocity.x=0
	velocity.y = 0
