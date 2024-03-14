extends Area2D

@export var hp = 3
@onready var parent = get_parent()
@onready var revive = $Revive
@onready var die = $Die


func _physics_process(delta):
	if hp == 0:
		hp = -1
		parent.action_when_die()
		die.start()
		revive.start()
		


func _on_area_entered(area):
	hp-= 1


func _on_timer_timeout():
	parent.revive()
	parent.action_when_revive()	
	queue_free()


func _on_die_timeout():
	parent.die()
	
