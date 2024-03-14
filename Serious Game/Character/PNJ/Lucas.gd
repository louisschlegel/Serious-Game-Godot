extends "res://Character/PNJ/PNJ.gd"

@onready var detectPunchCol = $pnjDetectPunch/CollisionShape2D
@onready var interactDialogCol = $InteractDialog/CollisionShape2D
@onready var interactDialog = $InteractDialog
@onready var hurtBox = $HurtBox/CollisionShape2D
@onready var setLeftIdle = $setLeftIdle
@onready var popUp = MainUI.get_child(0)

var nbInteract = 0;

signal finInteract


func _on_prof_jjb_prof_jjb_finished():
	interactDialogCol.disabled = false
	interactDialog.change_visibility_excla()
	


func action_when_die():
	detectPunchCol.queue_free()
	hurtBox.disabled = true

func action_of_pnj():
	interactDialogCol.disabled = true
	interactDialog.change_visibility_excla()
	if nbInteract == 0:
		hurtBox.disabled = false
		detectPunchCol.disabled = false
		popUp.show_message(3)
	if nbInteract == 1:
		emit_signal("finInteract")
	nbInteract+=1

func action_when_revive():
	interactDialogCol.disabled = false
	interactDialog.change_visibility_excla()
	setLeftIdle.start()
	popUp.show_message(4)

func _on_set_left_idle_timeout():
	animationPlayer.play("IdleLeft")

