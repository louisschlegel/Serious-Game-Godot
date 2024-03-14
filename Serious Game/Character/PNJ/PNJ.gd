extends "res://Character/Character.gd"


var numDialog = 0;
@export var senseStartSprite = 1

var AttackSpeed


func ready_child():
	state = PNJ
	type = CharacterType.PNJ
	var vec:Vector2 = Vector2(1,0)
	match senseStartSprite:
		1:
			animationPlayer.play("IdleDown")
			vec = Vector2(0,1)
		2:
			animationPlayer.play("IdleLeft")
			vec = Vector2(-1,0)
		3:
			animationPlayer.play("IdleUp")
			vec = Vector2(0,-1)
		4:
			animationPlayer.play("IdleRight")
			vec = Vector2(1,0)
		_:
			animationPlayer.play("IdleDown")
			vec = Vector2(0,1)
			
	animationTree.set("parameters/Idle/blend_position", vec)
	animationTree.set("parameters/Punch/blend_position", vec)
	if has_node("AttackSpeed"):
		set_punch_state()
		AttackSpeed = $AttackSpeed
		AttackSpeed.start()


func get_num_dialog():
	return numDialog

func incremente_num_dialog():
	numDialog = numDialog + 1
	

func _on_attack_speed_timeout():
	set_punch_state()
	AttackSpeed.start()
	
func disable_pnj():
	visible = false
	var coliPnj = $CollisionShape2D
	coliPnj.disabled = true
	if(has_node("WaiterMovement")):
		var coli = get_node("WaiterMovement/CollisionShape2D")
		coli.disabled = true
	if(has_node("InteractDialog")):
		var coli = get_node("InteractDialog/CollisionShape2D")
		coli.disabled = true 
	if(has_node("InteractPlayerBox")):
		var coli = get_node("InteractPlayerBox/CollisionShape2D")
		coli.disabled = true 
	
func enable_pnj():
	visible = true
	var coliPnj = $CollisionShape2D
	coliPnj.disabled = false
	if(has_node("WaiterMovement")):
		var coli = get_node("WaiterMovement/CollisionShape2D")
		coli.disabled = false
	if(has_node("InteractDialog")):
		var coli = get_node("InteractDialog/CollisionShape2D")
		coli.disabled = false 
	if(has_node("InteractPlayerBox")):
		var coli = get_node("InteractPlayerBox/CollisionShape2D")
		coli.disabled = false 
