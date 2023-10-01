extends Node2D

var node_to_install
var pro = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_node("Window/Control/InstallProgress").value += snapped(delta,0.1) + 0.5
	if get_node("Window/Control/InstallProgress").value >= 100:
		var i = node_to_install.instantiate()
		get_node("/root/Desktop").add_child(i)
		i.global_position = get_node("Window").global_position
		i.position += Vector2(randf_range(0.5, 10), randf_range(0.5, 10))
		i.is_pro = pro
		i.check_pro()
		queue_free()
