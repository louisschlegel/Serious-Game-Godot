extends Area2D


var punch:bool = false
@onready var parent = get_parent()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if punch:
		parent.set_punch_state()


func _on_area_entered(area):
	punch = true


func _on_area_exited(area):
	punch = false
