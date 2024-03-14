extends "res://Waiter/Waiter.gd"


func act(area):
	if(!DialogueBox.inDialogue):
		var numDialog = parent.get_num_dialog()
		DialogueBox.start_dialogue(character, numDialog)
