extends "res://Character/Character.gd"



var DialogueBox = MainUI.get_node("DialogueBox")

	
	
func ready_child():
	type = CharacterType.PLAYER
	DialogueBox.connect(DialogueBox.dialogue_s.get_name(), switch_dialogue)


func switch_dialogue():
	if(!inDialogue):
		inDialogue = true
		animationState.travel("Idle")
		velocity = Vector2.ZERO
	else:
		inDialogue = false
