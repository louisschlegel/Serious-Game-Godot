extends "res://Interaction/Interact.gd"

@onready var parent = get_parent()
@onready var character:String = parent.name 		#Nom du PNJ
@onready var numDialog = parent.get_num_dialog()
@export var maxDialog = 0
@export var autoIncrement:bool = true
@onready var excla = $exclamationMark
@export var boolExcla = true

func ready_child():
	if !boolExcla:
		excla.visible = false

#Appellée quand le joueur est proche d'un PNJ, qu'il appuie sur la touche E
func interact():
	if(!DialogueBox.inDialogue):
		numDialog = parent.get_num_dialog()
		if maxDialog == numDialog:
			parent.action_of_pnj()
		DialogueBox.start_dialogue(character, parent.get_num_dialog())
		if autoIncrement:
			parent.incremente_num_dialog()
			
func change_visibility_excla():
	if boolExcla:
		excla.visible = false
		boolExcla = false
	else:
		excla.visible = true
		boolExcla = true
		
