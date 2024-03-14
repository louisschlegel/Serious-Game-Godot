extends NinePatchRect

const jsonPath:String = "res://Scenario/JSON/popUp.json"

@onready var Text:Label = get_node("Label")
@onready var lineHeight:int = Text.get_line_height() + 3
@onready var padding:int = get_patch_margin(SIDE_TOP)

var jsonParsed
var messages:Array
var msgNb:int = 0

var i:int = 0		#DEBUG

func _ready():
	load_json()

#Lire, charger et parser le json au début du jeu
func load_json():
	if FileAccess.file_exists(jsonPath):
		var dataFile = FileAccess.open(jsonPath, FileAccess.READ)
		jsonParsed = JSON.parse_string(dataFile.get_as_text())
	else:
		printerr("File doesn't exist")

#Fonction à appeller au début de chaque scene
func init_scene(code:int):
	var scene:String = "Scene" + str(code)
	if(jsonParsed.has(scene)):
		messages = Array(jsonParsed[scene])
		print(messages)
		msgNb = messages.size()
	else:
		printerr("[ERR: PopUpBox.init_scene()\n-> Name of current scene has been foundn't in JSON]")


#Afficher un message, dimensionne et affiche la fenêtre automatiquement
func show_message(index:int):
	if(index < msgNb):
		Text.set_text(messages[index])
		resize_box()
		
		if(!visible):
			set_visible(true)
	else:
		set_visible(!visible)
		printerr("[ERR: PopUpBox.show_message() -> Out of bounds]")

#Redimensionne la fenetre en fonction du nombre de lignes à afficher
func resize_box():
	var lineNb = Text.get_line_count()
	var newSize:Vector2 = Vector2(size.x, lineNb * lineHeight + padding)
	set_size(newSize)

#DEBUG | (Décommenter:Ctrl+K)
#func _input(event):
#	if(event.is_action_pressed("debug_action")):
#		show_message(i)
#		i += 1
