extends "res://Inventaire/Items/Item.gd"

signal knifeTook

func send_signal():
	emit_signal("knifeTook")
