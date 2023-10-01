extends Node2D

var time_til_kill = 10

func _process(delta):
	time_til_kill -= delta
	if time_til_kill < 0:
		get_tree().quit()
