extends Node

@export var hard_drive_space: int = 10
@export var spawn: Node

@onready var bsod = preload("res://Scenes/bsod.tscn")
@onready var win = preload("res://Scenes/winner.tscn")
@onready var enemy_prefab = preload("res://Scenes/enemy.tscn")
@onready var wave_button = get_node("/root/Desktop/Button")
var hp = 1
var wave_active = false

# , = new enemy, use extra chars for padding
@export var waves: Array[String]
var time_til_next_group = 5
func _ready():
	pass
func spawn_group():
	var offset = Vector2(0,0)
	for i in waves[0].rsplit(","):
		if i == "1":
			var n = enemy_prefab.instantiate()
			add_child(n)
			n.position = spawn.position + offset
		if i == "2":
			var n = enemy_prefab.instantiate()
			add_child(n)
			n.position = spawn.position + offset
			n.get_node("Sprite2D").modulate = (Color(0.1,255,0.1))
			n.max_hp = 2
			n.hp = 2
			n.speed_mod = 2.5
		if i == "3":
			var n = enemy_prefab.instantiate()
			add_child(n)
			n.position = spawn.position + offset
			n.get_node("Sprite2D").modulate = (Color(255,255,0))
			n.max_hp = 9
			n.hp = 9
			n.speed_mod = 0.8
			n.scale *= 1.4
			n.space_on_death = 3
		if i == "4":
			var n = enemy_prefab.instantiate()
			add_child(n)
			n.position = spawn.position + offset
			n.get_node("Sprite2D").modulate = (Color(0.1,0.1,0.1))
			n.max_hp = 1
			n.hp = 13
			n.speed_mod = 1.4
			n.scale *= 2
			n.space_on_death = 3
		if i == "5":
			var n = enemy_prefab.instantiate()
			add_child(n)
			n.position = spawn.position + offset
			n.get_node("Sprite2D").modulate = (Color(1,0.15,0.77))
			n.max_hp = 13
			n.hp = 13
			n.speed_mod = 2.4
			n.scale *= 1.6
			n.space_on_death = 3
		if i == "6":
			var n = enemy_prefab.instantiate()
			add_child(n)
			n.position = spawn.position + offset
			n.get_node("Sprite2D").modulate = (Color(0.03,0.87,1))
			n.max_hp = 30
			n.hp = 30
			n.speed_mod = 2
			n.scale *= 2.5
			n.space_on_death = 3
		offset += Vector2(125,0)
	if len(waves) > 1:
		waves.remove_at(0)

func _process(delta):
	if hp <= 0:
		get_tree().change_scene_to_packed(bsod)
	if hp >= 100:
		get_tree().change_scene_to_packed(win)
	wave_active = false
	for i in get_children():
		if i.name != "Spawn":
			wave_active = true
			break
			
	if wave_active:
		wave_button.visible = false
	else:
		wave_button.visible = true
		
func _on_button_pressed():
	if !wave_active:
		spawn_group()
		wave_active = true
