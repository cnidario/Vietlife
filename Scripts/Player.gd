extends KinematicBody2D

export (PackedScene) var Bullet
export (NodePath) var PlayerBullets

const RUN_SPEED = 120
const JUMP_SPEED = 350
const GRAVITY = 1000

enum Facing {RIGHT, LEFT}
var velocity = Vector2(0, 0)
var facing = Facing.RIGHT
var bullets = []

func _physics_process(delta):
	if Input.is_action_just_pressed("shoot"):
		shoot()
	if Input.is_action_pressed("right"):
		velocity.x = RUN_SPEED
		$Animations.play("run")
		$Animations.flip_h = false
		facing = Facing.RIGHT
	elif Input.is_action_pressed("left"):
		velocity.x = -RUN_SPEED
		$Animations.play("run")
		$Animations.flip_h = true
		facing = Facing.LEFT
	else:
		$Animations.play("idle")
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -JUMP_SPEED
	if not is_on_floor():
		$Animations.play("jump")
	
	velocity.y += GRAVITY*delta
	velocity = move_and_slide(velocity, Vector2.UP)
		 
	velocity.x = lerp(velocity.x, 0, 0.2)

func gun_facing_direction():
	if facing == Facing.RIGHT:
		return Vector2(1,0)
	elif facing == Facing.LEFT:
		return Vector2(-1,0)
func shoot():
	var bullet_instance: Node2D = Bullet.instance()
	get_node(PlayerBullets).add_child(bullet_instance)
	bullet_instance.init($GunBarrel.global_position, gun_facing_direction())
	bullets.append(bullet_instance)
