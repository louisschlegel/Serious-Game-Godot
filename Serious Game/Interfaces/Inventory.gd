extends VBoxContainer

@onready var DialogueBox = MainUI.get_node("DialogueBox")
const folderPath:String = "res://Asset/Items/"


var inventory:Array[String]

var MAX_SIZE:int = 5
var itemCount:int = 0

var inDialogue:bool = false

var tabItem32 = ["belt"]


func _ready():
	DialogueBox.connect(DialogueBox.dialogue_s.get_name(), switch_dialogue)

func new_scene():
	var tabItem32 = null
	itemCount = 0
	inventory.clear()
	update_hotbar()
#Renvoie l'index d'un item si il est présent dans l'inventaire, -1 sinon
func has_item_at(item:String) -> int:
	var i = 0;
	
	for obj in inventory:
		if(obj == item):
			return i
		i += 1
	
	return -1

#Ajouter un item si il y a de la place dans l'inventaire
func add_item(item:String):
	if(itemCount < MAX_SIZE):
		inventory.append(item)
		itemCount += 1
		update_hotbar()
	else:
		printerr("[add_item - Inventaire plein.]")

#Retirer un item

func remove_item(i):
	if(itemCount > 0):	#DEBUG : Retirer le dernier item
		inventory.pop_at(i)
		itemCount -= 1
		update_hotbar()
	else:						#Objet inexistant, absent ou inventaire vide
		printerr("[remove_item - Objet absent.]")

#FONCTION PAS ENCORE UTILE - A COMBINER AVEC get_item_name()
func replace_underscores(itemName:String) -> String:
	var i = itemName.find('_')
	while(i != -1):
		itemName[i] = ' '
		i = itemName.find('_')
	return itemName

#Obtient le chemin de la texture d'un objet
func get_sprite_path(itemName:String) -> String:
	return folderPath + itemName + ".png"

#Appellée à chaque ajout et retrait d'un objet de l'inventaire
func update_hotbar():
	var i = 0
	for box in get_children():
		var Box = box.get_node("Box")
		if(i < itemCount):
			var spritePath = get_sprite_path(inventory[i])
			if inventory[i] in tabItem32:
				Box.scale.x = 0.5
				Box.scale.y = 0.5		
			Box.texture = load(spritePath)
		else:
			Box.texture = null;
		i += 1

#Bouton On/Off pour l'état inDialogue
func switch_dialogue():
	inDialogue = !inDialogue
	set_visible(!inDialogue)

func have_phone():
	return "phoneOn" in inventory 
