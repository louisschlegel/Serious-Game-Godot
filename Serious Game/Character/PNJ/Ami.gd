extends "res://Character/PNJ/PNJ.gd"

signal finAmi
@onready var interactDialogCol = $InteractDialog/CollisionShape2D
@onready var interactDialog = $InteractDialog

func action_of_pnj():
	interactDialog.change_visibility_excla()
	interactDialogCol.disabled = true
	emit_signal("finAmi")


func _on_lucas_fin_interact():
	interactDialog.change_visibility_excla()
	interactDialogCol.disabled = false

