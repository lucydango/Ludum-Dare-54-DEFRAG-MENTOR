extends Button

@onready var installer = preload("res://Scenes/installer.tscn")
var item = null
var item_name = ""
var price = 0

func update():
	text = "Install "+item_name+" \n"+str(price)+"KB"
	
func _on_pressed():
	if get_node("/root/Desktop/GameTracker").hard_drive_space - price >= 0:
		var i = installer.instantiate()
		i.node_to_install = item
		get_node("/root/Desktop").add_child(i)
		i.position = Vector2(400 + randf_range(1, 50),200)
		get_node("/root/Desktop/GameTracker").hard_drive_space -= price
		if price > 10:
			i.pro = true
