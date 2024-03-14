extends Control

@onready var inputBindingBouton = preload("res://Paramètres/ButtonInput.tscn")
@onready var actionList = self

var isRemapping = false
var actionToRemap = null
var remappingButton = null

var inputActions = {
	"move_up" : "Avancer",
	"move_down" : "Reculer",
	"move_left" : "Aller à Gauche",
	"move_right" : "Aller à Droite",
	"interact" : "Intéragir",
	"next_dialogue" : "Prochain Dialogue",
	"punch" : "Frapper",
	"show_phone" : "Téléphone",
	"pause" : "Pause"
}
func _ready():
	_create_action_list()

func _create_action_list():
	InputMap.load_from_project_settings()
	for item in actionList.get_children():
		item.queue_free()
		
	for action in inputActions:
		var button = inputBindingBouton.instantiate()
		var actionLabel = button.find_child("LabelAction")
		var inputLabel = button.find_child("LabelInput")
		
		actionLabel.text = inputActions[action]
		
		var events = InputMap.action_get_events(action)
		if events.size() > 0:
			inputLabel.text = events[0].as_text()
		else:
			inputLabel.text = ""
		
		actionList.add_child(button)
		button.pressed.connect(_on_input_button_pressed.bind(button, action))

func _on_input_button_pressed(button, action):
	if !isRemapping:
		isRemapping = true
		actionToRemap = action
		remappingButton = button
		button.find_child("LabelInput").text = "Press key to bind..."
	
func _input (event):
	if isRemapping:
		if (event is InputEventKey ||
			(event is InputEventMouseButton && event.pressed)
		):
				InputMap.action_erase_events(actionToRemap)
				InputMap.action_add_event(actionToRemap, event)
				_update_action_list(remappingButton, event)
				
				isRemapping = false
				actionToRemap = null
				remappingButton = null

func _update_action_list(button, event):
	button.find_child("LabelInput").text = event.as_text()
