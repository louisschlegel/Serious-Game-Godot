extends "res://Waiter/Waiter.gd"

@export var movement = [Vector2(1,0),2]

func act(area):
	parent.add_movement(movement[0],movement[1])
	if(!DialogueBox.inDialogue):
		var numDialog = parent.get_num_dialog()
		DialogueBox.start_dialogue(character, numDialog)
