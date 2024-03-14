extends "res://Character/PNJ/PNJ.gd"

@onready var interactDialogCol = $InteractDialog/CollisionShape2D
@onready var interactDialog = $InteractDialog

signal fireFighterTalked

func _on_ahmet_ahmet_talked():
	add_movement(Vector2(1,0),0.3)
	add_movement(Vector2(0,-1),1.5)
	add_movement(Vector2(1,0),0.5)
	animationPlayer.play("IdleDown")
	interactDialog.change_visibility_excla()
	interactDialogCol.disabled = false

func action_of_pnj():
	interactDialog.change_visibility_excla()
	interactDialogCol.disabled = true
	emit_signal("fireFighterTalked")
