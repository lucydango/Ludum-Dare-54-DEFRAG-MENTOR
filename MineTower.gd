extends Node2D

var has_exploded
var time_to_delete = 0
var enemies_to_kill = []
#Deprecated for this type of tower
var is_pro

#Deprecated for this type of tower
func check_pro():
	pass
	
func _process(delta):
	if has_exploded:
		time_to_delete += delta
		get_node("Window/WindowBackground/Body/Sprite2D/Explosion/Sprite2D").visible = true
		# Who needs tweens when you can just... make thing bigger?
		get_node("Window/WindowBackground/Body/Sprite2D/Explosion/Sprite2D").scale *= 1.038
		if time_to_delete > 1:
			for i in enemies_to_kill:
				var _weakref = weakref(i)
				if _weakref.get_ref():
					i.get_parent().hp -= 5
					i.get_parent().check_if_dead()
			queue_free()


func _on_vision_area_entered(area):
	if area.name != "Vision":
		print("ping")
		get_node("Window/WindowBackground/Body/Sprite2D/Explosion").monitoring = true
		get_node("Window/WindowBackground/Body/Sprite2D/Explosion").monitorable = true
		has_exploded = true
		get_node("AudioStreamPlayer2D").play()


func _on_explosion_area_entered(area):
	if area.name == "Collider":
		enemies_to_kill.append(area)
		
