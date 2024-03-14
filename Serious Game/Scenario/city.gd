extends Node2D


var player
var playerSprite
var phone
var camera
var pause
@onready var popUp = MainUI.get_child(0)
# Called when the node enters the scene tree for the first time.
func _ready():
	player = $Player
	playerSprite = $Player/Sprite2D
	phone = $Phone
	camera = $Player/Camera2D
	pause = $Player/Pause
	popUp.show_message(0)
	
	playerSprite.texture = preload("res://Asset/PNJ/Joueur_chill.png")
	
	
func _physics_process(delta):
	pause.position = player.position + Vector2(-55,-50)
	phone.position = player.position + Vector2(-300,0)

func _on_policier_1_fin_scene():
	get_parent().go_to_recap(name)
