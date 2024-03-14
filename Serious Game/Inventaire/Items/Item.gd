extends Node2D

@export var item:int
var itemName:String
var flash = true


@onready var Inventory = MainUI.get_node("Inventory")
@onready var Sprite = $Sprite2D
@onready var timer = $Timer

@onready var couleur = Sprite.modulate



func _ready():
	timer.start()

func use():
	pass

func change_flash():
	if(flash):
		Sprite.modulate = Color(255,255,0)
		flash = false
		timer.start()
			
	else:
		Sprite.modulate = couleur
		timer.start()
		flash = true
		

func _on_timer_timeout():
	change_flash()

func send_signal():
	pass
