class_name HurtBox
extends Area2D

@export var dmg: int = 1

func _ready():
	area_entered.connect(on_area_entered)
	pass
	
func on_area_entered(e: Area2D) -> void:
	if e is Hitbox:
		e.take_dmg(dmg)
