extends NinePatchRect

#Signal émit pour bloquer / débloquer le joueur
signal dialogue_s()	

#Objets visuels
@onready var label = $Label
@onready var timer = $Timer

const jsonPath:String = "res://Dialogues/dialoguesPNJ.json"
#Dialogues découpés dans un dictionnaire
var jsonData


var skip:bool = false
#Délais entre chaque charactères
const timeLetter:float = 0.03
const timeSpace:float = 0.06
const timePunctuation:float = 0.02

var inDialogue:bool = false
var nextLine:bool = false

var Lines:Array
var line:String

var iLine:int = 0
var nbLines:int
var i:int = 0
var lenLine:int
var numDialogs

func _ready():
	jsonData = load_json_file()

#Lit, découpe et charge le fichier json des dialogues de PNJ
func load_json_file():
	if FileAccess.file_exists(jsonPath):
		var dataFile = FileAccess.open(jsonPath, FileAccess.READ)
		var dataParsed = JSON.parse_string(dataFile.get_as_text())
		return dataParsed
	else:
		printerr("File doesn't exist")

#Obtient la bulle de dialogue associée au PNJ qui parle actuellement au joueur
func load_dialogue(character:String):
	var dialogs:Array = Array(jsonData[character])
	var dialog
	if dialogs.size() > numDialogs:
		dialog = dialogs[numDialogs]
	else:
		printerr("Problème d'index tab")
		dialog = ["Erreur"]
	return dialog

#Affiche la boite de dialogue et lance le dialogue du PNJ
func start_dialogue(character:String, numDialog:int):
	numDialogs = numDialog 
	inDialogue = true
	Lines = load_dialogue(character)
	nbLines = Lines.size()
	iLine = 0
	
	show()
	
	dialogue_s.emit()
	print_line()

#Affichage de chaque lignes
func print_line():
	label.text = ""
	line = Lines[iLine]
	i = 0
	lenLine = line.length()
	
	print_letter()

#Affichage de chaque lettres
func print_letter():
	label.text += line[i]
	i += 1
	
	if i >= lenLine:
		nextLine = true
		return
	
	if(skip):
		print_letter()
		return
	
	match line[i]:
		"!", ".", ",", "?":
			timer.start(timePunctuation)
		" ":
			timer.start(timeSpace)
		_:
			timer.start(timeLetter)

#Fonction chargée de gerer la touche 'E' quand le joueur est dans un dialogue
func _unhandled_input(event):
	if (event.is_action_pressed("next_dialogue") && inDialogue):
		if(nextLine):
			nextLine = false
			skip = false
			iLine += 1
			
			if iLine >= nbLines:
				set_visible(false)
				inDialogue = false
				dialogue_s.emit()
				return
			
			print_line()
		elif(i > 1):
			skip = true

#Appellée entre chaque lettre
func _on_timer_timeout():
	print_letter()
