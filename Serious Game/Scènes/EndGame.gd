extends Control

@onready var buttonMenu = $ButtonMenu
@onready var buttonExit = $ButtonExit

# Called when the node enters the scene tree for the first time.
func _ready():
	buttonMenu.pressed.connect(_on_ButtonMenu_pressed)
	buttonExit.pressed.connect(_on_ButtonExit_pressed)

func _on_ButtonMenu_pressed():
	visible = false
	var menuScene = preload("res://Scènes/MainMenu.tscn")
	get_tree().change_scene_to_packed(menuScene)

func _on_ButtonExit_pressed():
	get_tree().quit()
