class_name Hitbox
extends Area2D

signal took_dmg(damage: int)

func take_dmg(dmg: int) -> void:
	print("took", dmg, "dmg")
	took_dmg.emit(dmg)
