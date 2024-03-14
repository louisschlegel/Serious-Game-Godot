extends "res://Interaction/Interact.gd"
@onready var Inventory = MainUI.get_node("Inventory")

@onready var itemName:String = get_parent().name

func interact():
	Inventory.add_item(itemName)
	get_parent().send_signal()
	get_parent().queue_free()
	
