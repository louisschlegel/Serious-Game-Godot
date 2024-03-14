extends "res://Inventaire/Items/Item.gd"

signal upPnjDialog
@onready var popUp = MainUI.get_child(0)

func send_signal():
	emit_signal("upPnjDialog")
	popUp.show_message(2)
	get_parent().set_belt()
