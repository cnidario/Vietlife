extends Camera2D

onready var player = $"../Player"

func _process(delta):
	position.x = player.position.x
