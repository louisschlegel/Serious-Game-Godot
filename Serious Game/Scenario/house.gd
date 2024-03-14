extends Node2D

var sabrina
var tpOutSideCol
var player
var camera
var positionTpOutside
var positionTpHouse
var alreadyGoOutside = false
var policier
var spritePlayer
var pause 
@onready var popUp = MainUI.get_child(0)

func _physics_process(delta):
	pause.position = player.position 
# Called when the node enters the scene tree for the first time.
func _ready():
	sabrina = $Sabrina
	sabrina.disable_pnj()
	tpOutSideCol = $tpOutside/CollisionShape2D
	player = $Player
	camera = $Player/Camera2D
	positionTpHouse = $positionTpHouse
	positionTpOutside = $positionTpOutside2
	policier = $Policier3
	spritePlayer = $Player/Sprite2D
	
	pause = $Player/Pause
	
	spritePlayer.texture = preload("res://Asset/PNJ/Joueur_detective.png")
	popUp.show_message(0)
	
	
	

func _on_knife_knife_took():
	sabrina.enable_pnj()
	sabrina.add_movement(Vector2(0,-1),1)
	sabrina.add_movement(Vector2(0,1),0.01)
	


func _on_sabrina_fin_sabrina():
	tpOutSideCol.disabled = false
	popUp.show_message(1)
	


func _on_tp_outside_area_entered(area):
	player.position = positionTpOutside.position
	if(!alreadyGoOutside):
		popUp.show_message(2)
		policier.incremente_num_dialog()
		alreadyGoOutside = true


func _on_tp_house_area_entered(area):
	player.position = positionTpHouse.position
	


func _on_policier_3_fin_scene():
	get_parent().go_to_recap(name)
