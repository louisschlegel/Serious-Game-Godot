extends "res://Character/PNJ/PNJ.gd"

signal profJJBFinished

func _on_belt_up_pnj_dialog():	
	incremente_num_dialog()
	if numDialog >=1:
		emit_signal("profJJBFinished")


func _on_lucas_fin_interact():
	incremente_num_dialog()


func _on_ami_fin_ami():
	incremente_num_dialog()
