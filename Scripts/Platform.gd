extends Node2D

onready var TweenNode = $Tween
onready var init_pos = position

func _process(delta):
	TweenNode.interpolate_property(self, "position", position, position + Vector2(0, -10), 0.25, Tween.TRANS_BACK, Tween.EASE_IN_OUT)
	TweenNode.start()
