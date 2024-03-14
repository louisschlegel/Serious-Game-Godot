extends "res://Character/PNJ/PNJ.gd"

signal finSabine

var alreadyFinish = false

func action_of_pnj():
	if !alreadyFinish:
		emit_signal("finSabine")
		alreadyFinish = true
