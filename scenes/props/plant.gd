class_name Plant
extends Node


func _on_hitbox_took_dmg(_damage: int):
	queue_free()
