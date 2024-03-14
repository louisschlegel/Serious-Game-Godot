extends Area2D

@export var willQueueFree:bool = true
@onready var parent = get_parent()
@onready var character:String = parent.name 		#Nom du PNJ
var DialogueBox = MainUI.get_node("DialogueBox")


func _on_area_entered(area):
	act(area)
	if willQueueFree:
		queue_free()
	

func act(area):
	pass
