extends Control

@onready 	var buttonValidation = $PanelContainer/MarginContainer/VBoxContainer2/VBoxContainer/ButtonValidation
@onready 	var VolumeSlideBar = $PanelContainer/MarginContainer/VBoxContainer2/VBoxContainer/VolumeSlideBar
# Called when the node enters the scene tree for the first time.
func _ready():
	VolumeSlideBar.value_changed.connect(_on_Volume_value_changed)
	buttonValidation.pressed.connect(_on_ButtonValidation_pressed)

func _on_ButtonValidation_pressed():
	visible = false
	get_parent().show()

func _on_Volume_value_changed(value):
	var displayValue:Label = VolumeSlideBar.get_node("./Value")
	displayValue.set_text(str(VolumeSlideBar.get_value()) + " %")
	var db = -pow(100 - value, 0.67)
	if value > 0:
		AudioServer.set_bus_volume_db(0, db)
	else:
		AudioServer.set_bus_volume_db(0, -80)
