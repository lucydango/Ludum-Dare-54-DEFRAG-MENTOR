extends Node2D

@export var bullet_prefab: PackedScene
@export var fire_rate: float = 1.5
var until_shot
var things_to_shoot = []
@export var is_pro = false
# Called when the node enters the scene tree for the first time.
func _ready():
	until_shot = fire_rate

func check_pro():
	if is_pro:
		fire_rate = fire_rate / 2
		get_node("Window/Sprite2D").animation = "pro"
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if until_shot > 0:
		until_shot -= delta
	else:
		shoot()
		until_shot = fire_rate
		
func shoot():
	if things_to_shoot == []:
		return
	var bullet = bullet_prefab.instantiate()
	get_node("/root/Desktop").add_child(bullet)
	bullet.global_position = get_node("Window/Sprite2D").global_position
	bullet.look_at(things_to_shoot[0].position)
	bullet.set_mv(-(get_node("Window/Sprite2D").global_position - things_to_shoot[0].global_position).normalized())
	get_node("Window/AudioStreamPlayer2D").play()
	
func _on_vision_area_entered(area):
	var bullet = bullet_prefab.instantiate()
	things_to_shoot.append(area)


func _on_vision_area_exited(area):
	var ticker = 0
	for i in things_to_shoot:
		if i == area:
			things_to_shoot.remove_at(ticker)
		ticker += 1
