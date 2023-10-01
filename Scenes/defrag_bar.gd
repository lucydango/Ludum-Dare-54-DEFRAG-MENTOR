extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_node("Window/Control/Label").text = "DRIVE "+str(100 - get_node("/root/Desktop/GameTracker").hp)+"%\nFRAGMENTED"
	get_node("Window/Control/TextureProgressBar").value = get_node("/root/Desktop/GameTracker").hp
