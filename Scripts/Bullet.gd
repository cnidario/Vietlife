extends KinematicBody2D

const SPEED = 3
var velocity = Vector2(0, -10)

func init(p, direction):
	global_position = p
	velocity = direction.normalized() * SPEED
	
func _physics_process(delta):
	move_and_collide(velocity)
