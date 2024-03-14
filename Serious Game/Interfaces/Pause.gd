extends Control
@onready var gamePaused = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	var buttonResume = $PanelContainer/VBoxContainer/MarginContainer/ButtonResume
	var buttonMenu = $PanelContainer/VBoxContainer/MarginContainer4/ButtonMenu
	var buttonExit = $PanelContainer/VBoxContainer/MarginContainer3/ButtonExit
	buttonResume.pressed.connect(_on_ButtonResume_pressed)
	buttonExit.pressed.connect(_on_ButtonExit_pressed)
	buttonMenu.pressed.connect(_on_ButtonMenu_pressed)

func _unhandled_input (event):
	if event. is_action_pressed ("pause"):
		gamePaused = !gamePaused
		if gamePaused:
			Engine. time_scale = 0
			self.visible = true
		else:
			Engine. time_scale = 1
			self.visible = false

func _on_ButtonResume_pressed():
	visible = false

func _on_ButtonMenu_pressed():
	visible = false
	var menuScene = preload("res://Scènes/MainMenu.tscn")
	get_tree().change_scene_to_packed(menuScene)


func _on_ButtonExit_pressed():
	get_tree().quit()
