extends Control
@onready var settingsScene= preload("res://Paramètres/Settings.tscn").instantiate()
func _ready():
	var playButton = $PanelContainer/VBoxContainer/VBoxContainer/PlayButton
	var exitButton = $PanelContainer/VBoxContainer/VBoxContainer/ExitButton
	var settingsButton = $PanelContainer/VBoxContainer/VBoxContainer/SettingsButton
	playButton.pressed.connect(_on_PlayButton_pressed)
	exitButton.pressed.connect(_on_ExitButton_pressed)
	settingsButton.pressed.connect(_on_SettingsButton_pressed)
	MainUI.hide()

func _on_PlayButton_pressed():
	get_tree().change_scene_to_file("res://Scènes/ScenePrincipale.tscn")


func _on_ExitButton_pressed():
	get_tree().quit()

func _on_SettingsButton_pressed():
	$PanelContainer.hide()
	add_child(settingsScene)
	settingsScene.visible = true

func _process(_delta):
	if !settingsScene.visible && settingsScene != null:
		$PanelContainer.visible = true
