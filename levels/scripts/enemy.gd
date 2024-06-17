extends CharacterBody2D


const SPEED = 1580.0
const JUMP_VELOCITY = -400.0

@onready var wall := $wall as RayCast2D
@onready var texture := $texture as Sprite2D

var direction := 1
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	if wall.is_colliding():
		direction *= -1
		wall.scale.x *= -1
	
	if direction == -1:
		texture.flip_h = true
	else:
		texture.flip_h = false
	velocity.x = direction * SPEED * delta

	move_and_slide()
