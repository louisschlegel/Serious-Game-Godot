extends "res://Character/PNJ/PNJ.gd"

signal ahmet_talked
var alreadyTalked = false

@onready var interactDialogCol= $InteractDialog/CollisionShape2D
@onready var interactDialog = $InteractDialog
@onready var popUp = MainUI.get_child(0)
	
func action_of_pnj():
	if numDialog == 0:
		if !alreadyTalked:
			popUp.show_message(1)
			emit_signal("ahmet_talked")
			interactDialogCol.disabled = true
			interactDialog.change_visibility_excla()
			alreadyTalked = true
	


func _on_pompier_fire_fighter_talked():
	interactDialogCol.disabled = false
	interactDialog.change_visibility_excla()
	popUp.show_message(2)
