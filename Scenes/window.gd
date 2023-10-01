extends Node2D

@export var icon: Texture
@export var movable: bool = true
@onready var button = preload("res://Scenes/desktop_bar_button.tscn")
var mouse_over_header = false
var offset = Vector2(0,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	var b = button.instantiate()
	b.window = self
	get_node("/root/Desktop/DesktopPanel/HBoxContainer").add_child(b)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Input.is_action_just_pressed("lmb") and mouse_over_header and movable:
		offset = get_global_mouse_position() - global_position 
	if Input.is_action_pressed("lmb") and mouse_over_header and movable:
		global_position = get_global_mouse_position() - offset


func _on_header_area_mouse_entered():
	if not Input.is_action_pressed("lmb"):
		mouse_over_header = true


func _on_header_area_mouse_exited():
	if not Input.is_action_pressed("lmb"):
		mouse_over_header = false
