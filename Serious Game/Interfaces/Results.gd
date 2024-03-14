extends CanvasLayer

@onready var buttonMenu = $Background/HBoxContainer/ButtonMenu
@onready var buttonValidate = $Background/HBoxContainer/ButtonValidate
@onready var buttonNextScene = $Background/HBoxContainer/ButtonNextScene
@onready var violenceType:Label = get_node("Background/Type")				#Titre de la violence
@onready var acceptability:HSlider = get_node("Background/VBoxContainer/Acceptability")	#Slider "moral"
@onready var legality:HSlider = get_node("Background/VBoxContainer/Legality")				#Slider "légal"
@onready var VBox = get_node("Background/Checkboxes")						#Container à Checkboxs
const jsonPath:String = "res://Interfaces/results.json"
var jsonData
var violences
@export var scene:String
signal nextScene

#Dictionnaire <string, Vector2> : contient les scores attribués par le joueur
var results
#Violence actuellement selectionnée
var selection:String

func _ready():
	jsonData = load_json_file()
	#Commenter cette partie pour enlever l'ajout par défaut des tests
	buttonMenu.pressed.connect(_on_ButtonMenu_pressed)
	buttonValidate.pressed.connect(_on_ButtonValidate_pressed)
	buttonNextScene.pressed.connect(_on_ButtonNextScene_pressed)

func load_nom():
	match scene:
		"Jujitsu":
			load_violence(scene, 1)
		"School":
			load_violence(scene, 2)
		"Node2D":
			load_violence(scene, 3)
		"House":
			load_violence(scene, 4)

func load_json_file():
	if FileAccess.file_exists(jsonPath):
		var dataFile = FileAccess.open(jsonPath, FileAccess.READ)
		var dataParsed = JSON.parse_string(dataFile.get_as_text())
		return dataParsed
	else:
		printerr("File doesn't exist")

#Obtient la bulle de dialogue associée au PNJ qui parle actuellement au joueur
func load_violence(violenceT:String, indexTypeViolence):
	violences = Array(jsonData[violenceT])

	var i = 0
	for violence in violences[1]:
		add_violence_type(violence, i, indexTypeViolence)
		i=i+1

#Ajouter un type de violence à faire juger au joueur
func add_violence_type(violence:String, i, indexTypeViolence):
	var check_obj = load("res://Interfaces/Check_Violence.tscn")
	var obj = check_obj.instantiate()
	var radio = obj.get_node("./Radio")
	var text:Label = radio.get_node("./Title") 
	text.set_text(violences[0][i])
	text = radio.get_node("./Description")
	text.set_text(violence)

	results = Vector2.ZERO;
	VBox.add_child(obj)

#Appellée quand le slider "Moral" vient d'être bougé
func _on_acceptability_changed(_value_changed):
	var displayValue:Label = acceptability.get_node("./Value")
	results = Vector2(acceptability.get_value(), legality.get_value())
	displayValue.set_text(str(acceptability.get_value()) + " %")

#Appellée quand le slider "Légal" vient d'être bougé
func _on_legality_changed(_value_changed):
	var displayValue:Label = legality.get_node("./Value")
	results = Vector2(acceptability.get_value(), legality.get_value())
	displayValue.set_text(str(legality.get_value()) + " %")

#   Appellée quand le joueur envoie ses résultats
#-> Retourne le dictionnaire des jugements du joueur
func _on_ButtonMenu_pressed():
	visible = false
	var menuScene = preload("res://Scènes/MainMenu.tscn")
	get_tree().change_scene_to_packed(menuScene)

func _on_ButtonValidate_pressed():
	buttonValidate.visible = false
	buttonMenu.visible = true
	buttonNextScene.visible = true
	acceptability.value = violences[2][0]
	legality.value = violences[2][1]
	acceptability.editable = false
	legality.editable = false
	
	$Background/Header.text = "Correction :"
	
	var displayValue:Label = legality.get_node("./Value")
	displayValue.set_text(str(legality.get_value()) + " %")
	
	displayValue = acceptability.get_node("./Value")
	displayValue.set_text(str(acceptability.get_value()) + " %")
	
	var result = 0
	if violences[2][0] - 10 < results.x && results.x < violences[2][0]:
		result = result + 1
	if violences[2][1] - 10 < results.y && results.y < violences[2][1]:
		result = result + 1
	return result

func _on_ButtonNextScene_pressed():
	emit_signal("nextScene")

