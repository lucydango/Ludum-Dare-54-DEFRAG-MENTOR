extends Node2D


@export var max_hp: int = 4
@export var strength: int = 5
@export var space_on_death: int = 2
@export var speed_mod: float = 1
var path = []
var hp
var start_delay = 5
var await_kill = false
var kill_timer = 0
func _ready():
	hp = max_hp
	for i in get_node("/root/Desktop/Bus").get_children():
		for x in i.get_children():
			if x.name != "Sprite2D":
				path.append(x)

func _process(delta):
	if await_kill:
		kill_timer += delta
		if kill_timer > 2:
			queue_free()
	elif start_delay <= 0:
		position -= (((position - path[0].global_position) * delta) * speed_mod)
		if (position - path[0].global_position).length() < 5:
			path.remove_at(0)
	else:
		start_delay -= randf_range(delta, delta * 10)
		if start_delay <= 0:
			speed_mod *= randf_range(0.7,1.3)


func _on_area_2d_area_entered(area):
	get_node("/root/Desktop/GameTracker").hp -= strength
	queue_free()


func _on_collider_area_entered(area):
	print(area.name)
	if area.name == "Collider":
		pass
	elif area.name == "Bullet":
		area.get_parent().queue_free()
		hp -= 1
	check_if_dead()

func check_if_dead():
	if hp <= 0:
		get_node("/root/Desktop/GameTracker").hard_drive_space += space_on_death
		get_node("/root/Desktop/GameTracker").hp += 1
		get_node("Sprite2D").visible = false
		get_node("Collider").queue_free()
		get_node("AudioStreamPlayer2D").play()
		await_kill = true
