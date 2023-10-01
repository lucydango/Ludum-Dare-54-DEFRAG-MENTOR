extends Control

@export var shop_items: Array[PackedScene]
@export var item_names: Array[String]
@export var shop_prices: Array[int]
@export var button_prefab: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	var ticker = 0
	for i in shop_items:
		var n = button_prefab.instantiate()
		n.item = i
		n.item_name = item_names[ticker]
		n.price = shop_prices[ticker]
		n.update()
		get_node("VBoxContainer").add_child(n)
		ticker += 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_node("Label").text = "SPACE: "+str(get_node("/root/Desktop/GameTracker").hard_drive_space)+"KB"
