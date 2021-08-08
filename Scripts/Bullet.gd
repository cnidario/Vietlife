extends Area2D

signal destroyed(enemy_hit)

const SPEED = 140
const LIFE = 2
var velocity = Vector2(0, -10)
var age = 0

func _ready() -> void:
	connect("body_entered", self, "_on_body_entered")

func init(p: Vector2, direction: Vector2 = Vector2(1,0)) -> void:
	global_position = p
	velocity = direction.normalized() * SPEED
	
func _process(delta: float) -> void:
	age += delta
	position += velocity*delta
	if age >= LIFE:
		queue_free()


func _on_body_entered(body: PhysicsBody2D) -> void:
	if body is GruntEnemy:
		body.damage(25)
		queue_free()
