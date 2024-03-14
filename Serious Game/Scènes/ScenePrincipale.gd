extends Node2D
@onready var recap = $ResultsJujitsu
@onready var inventory = $MainUI/Inventory
@onready var popUp = MainUI.get_child(0)
var nbScene = 0
var pointPlayer = 0
var sceneJjb
var pause
func _ready():
	popUp.init_scene(nbScene)
	sceneJjb = preload("res://Scenario/jujitsu.tscn").instantiate()
	pause = preload("res://Interfaces/Pause.tscn").instantiate()
	pause.hide()
	add_child(sceneJjb)
	nbScene = nbScene + 1
	MainUI.show()

func _on_results_next_scene():
	pointPlayer = pointPlayer + recap._on_ButtonValidate_pressed()
	var city
	var school
	var house
	var end
	for i in get_children():
		if i.name != "ResultsCity" and i.name != "ResultsJujitsu" and i.name != "ResultsHouse" and i.name != "ResultsSchool" and i.name != "EndGame":
			i.queue_free()
	recap.hide()
	match nbScene:
		1:
			recap = $ResultsCity
			popUp.init_scene(nbScene)
			city = preload("res://Scenario/city.tscn").instantiate()
			add_child(city)
			MainUI.show()
			
			nbScene = nbScene + 1
		2:
			recap = $ResultsSchool
			popUp.init_scene(nbScene)
			school = preload("res://Scenario/School.tscn").instantiate()
			add_child(school)
			MainUI.show()
			
			nbScene = nbScene + 1
		3:
			recap = $ResultsHouse
			popUp.init_scene(nbScene)
			house = preload("res://Scenario/house.tscn").instantiate()
			add_child(house)
			MainUI.show()
			
			nbScene = nbScene + 1
		4:
			$EndGame.position = Vector2(0,0)
			pointPlayer = pointPlayer * 12.5
			if pointPlayer > 50:
				$EndGame/PanelContainer/Win.show()
			else:
				$EndGame/PanelContainer/Lose.show()
			$EndGame/PanelContainer/MarginContainer/VBoxContainer/Label3.text = str(pointPlayer) + " %"
			$EndGame.visible = true
			MainUI.hide()
	MainUI.get_child(2).new_scene()
	
func go_to_recap(scene):
	MainUI.hide()
	recap.scene = scene
	recap.show()
	recap.load_nom()
