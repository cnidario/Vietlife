extends Node2D

onready var PlatformAnimPlayer = $PlatformAnimPlayer
func _ready():
	PlatformAnimPlayer.play("VerticalPlatform")
