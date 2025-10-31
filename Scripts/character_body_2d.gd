extends CharacterBody2D
const SPEED = 300
const JUMP_VELOCITY = -450.0
@onready var sprite_2d = $Sprite2D
@onready var jump_label = $"/root/Node/UI/Sprite2D/JumpLabel"

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Add run animation
	if (velocity.x > 1 || velocity.x < -1):
		if sprite_2d.animation != "Run" || not sprite_2d.is_playing():
			sprite_2d.play("Run")
	else:
		if sprite_2d.animation != "Idle" || not sprite_2d.is_playing():
			sprite_2d.play("Idle")
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		sprite_2d.animation = "Jump"
	
	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$JumpSound.play()
		jump_label.text = str(int(jump_label.text) + 1)
		
	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 13)
	
	move_and_slide()
	var isLeft = velocity.x < 0 
	sprite_2d.flip_h = isLeft
