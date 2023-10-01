extends Node2D

var last_pos = null
# Called when the node enters the scene tree for the first time.
func _ready():
	last_pos = global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position = get_global_mouse_position()
	last_pos = global_position
