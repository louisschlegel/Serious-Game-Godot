extends "res://Character/PNJ/PNJ.gd"

@onready var timer = $Timer
signal finScene

func action_of_pnj():
	print("action du pnj")
	timer.start()
	

func _on_timer_timeout():
	emit_signal("finScene")
	timer.queue_free()



