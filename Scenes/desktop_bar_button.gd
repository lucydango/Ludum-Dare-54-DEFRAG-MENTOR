extends Control

@export var icon: Texture2D
var window
func _ready():
	get_node("Button").icon = window.icon

func _process(delta):
	if !window:
		queue_free()
func _on_button_pressed():
	if window.movable:
		window.visible = !window.visible
