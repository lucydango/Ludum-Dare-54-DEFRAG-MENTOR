extends Node2D

var mv = Vector2(1,0)
var speed = 3
var time_alive = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	mv = mv.rotated(rotation)

func set_mv(_mv):
	mv = _mv

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_alive += delta
	if time_alive > 5:
		queue_free()
	position += mv * speed
