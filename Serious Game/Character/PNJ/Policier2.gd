extends "res://Character/PNJ/PNJ.gd"

@onready var timer = $Timer
signal finScene

func action_of_pnj():
	timer.start()
	


func _on_sabine_fin_sabine():
	incremente_num_dialog()


func _on_timer_timeout():
	emit_signal("finScene")
