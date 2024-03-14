extends Node2D

var pnjArnaud 
var pnjBastien 
var pnjMarie 
var pnjTristan
var playerCamera
var player
var tpBedroom
var tpClass
var phone
var positionPhoneBedroom
var positionPhoneClass
var spritePlayer
var camera
var pause

@onready var popUp = MainUI.get_child(0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pnjArnaud = $Arnaud
	pnjBastien = $Bastien
	pnjMarie = $Marie
	pnjTristan = $Tristan
	playerCamera = $Player/Camera2D
	player = $Player
	tpBedroom = $tpBedroom
	tpClass = $tpClass
	phone = $Phone
	spritePlayer = $Player/Sprite2D
	camera = $Player/Camera2D
	pause = $Player/Pause
	popUp.show_message(0)
	
	
	spritePlayer.texture = preload("res://Asset/PNJ/Joueur_chill.png")
	

	playerCamera.limit_left = 15
	playerCamera.limit_top = 0
	playerCamera.limit_right = 405
	playerCamera.limit_bottom = 208
	
	pnjBastien.disable_pnj()
	pnjMarie.disable_pnj()
	pnjTristan.disable_pnj()


func _physics_process(delta):
	phone.position = player.position  + Vector2(-150,0)
	pause.position = player.position

func tp_bedroom():
	
	playerCamera.limit_left = 646
	playerCamera.limit_top = -5
	playerCamera.limit_right = 945
	playerCamera.limit_bottom = 176
	playerCamera.zoom.y = 7.545
	playerCamera.zoom.x = 7.545
	player.position = tpBedroom.position
	
	
func tp_class():
	playerCamera.limit_left = 15
	playerCamera.limit_top = 0
	playerCamera.limit_right = 405
	playerCamera.limit_bottom = 208
	playerCamera.zoom.y = 5.5
	playerCamera.zoom.x = 5.5
	player.position = tpClass.position
	




func _on_tp_to_class_area_entered(area):
	tp_class()
	


func _on_tp_to_bedroom_area_entered(area):
	tp_bedroom()


func _on_sabine_fin_sabine():
	popUp.show_message(1)
	pnjBastien.enable_pnj()
	pnjMarie.enable_pnj()
	pnjTristan.enable_pnj()


func _on_fin_area_entered(area):
	get_parent().go_to_recap(name)


func _on_policier_2_fin_scene():
	get_parent().go_to_recap(name)
