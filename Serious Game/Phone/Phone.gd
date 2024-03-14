extends Control
@onready 	var button = $PanelContainer/MarginContainer/Panel/VideoPlayer/VideoStreamPlayer/PlayButton
@onready 	var videoVideo = $PanelContainer/MarginContainer/Panel/VideoPlayer/VideoStreamPlayer
@onready 	var MessageMarc = $PanelContainer/MarginContainer/Panel/Message/ScrollContainer/Marc
@onready 	var MessageMamanGaston = $PanelContainer/MarginContainer/Panel/Message/ScrollContainer/MamanGaston
@onready 	var MessageGroupeClasseGaston = $PanelContainer/MarginContainer/Panel/Message/ScrollContainer/GroupeDeClasse
@onready 	var buttonConv1 = $PanelContainer/MarginContainer/Panel/Message/HBoxContainer/CheckButtonConv1
@onready 	var buttonConv2 = $PanelContainer/MarginContainer/Panel/Message/HBoxContainer/CheckButtonConv2
@export 	var choixConv = []
@export 	var taille = 0
@onready 	var choixConvContainer = Array()
@onready var inventaire = MainUI.get_node("Inventory")

func _input(event):
	if(event.is_action_pressed("show_phone") && inventaire.have_phone()):
		if visible == true:
			visible = false
		else:
			visible = true
# Called when the node enters the scene tree for the first time.
func _ready():
	match choixConv[0]:
		"MamanGaston":
			choixConvContainer.insert(0, MessageMamanGaston)
			MessageMamanGaston.visible = true
			buttonConv1.text = "Maman"

		"GroupeClasseGaston":
			choixConvContainer.insert(0, MessageGroupeClasseGaston)
			MessageGroupeClasseGaston.visible = true
			buttonConv1.text = "Groupe de Classe"
		
		"Marc":
			choixConvContainer.insert(0, MessageMarc)
			MessageMarc.visible = true
			buttonConv1.text = "Sophie"

	if taille == 1:
		buttonConv2.visible = true
		match choixConv[1]:
			"MamanGaston":
				choixConvContainer.insert(1, MessageMamanGaston)
				MessageMamanGaston.visible = true
				buttonConv2.text = "Maman"

			"GroupeClasseGaston":
				choixConvContainer.insert(1, MessageGroupeClasseGaston)
				MessageGroupeClasseGaston.visible = true
				buttonConv2.text = "Groupe de Classe"
		
			"Marc":
				choixConvContainer.insert(1, MessageMarc)
				MessageMarc.visible = true
				buttonConv2.text = "Marc"
			
		buttonConv2.pressed.connect(_on_CheckButtonConv2_pressed)
		buttonConv1.pressed.connect(_on_CheckButtonConv1_pressed)

	button.pressed.connect(_on_PlayButton_pressed)
		
func _on_PlayButton_pressed():
	button.visible = false
	videoVideo.play()
	await videoVideo.finished
	button.visible = true

func _on_CheckButtonConv1_pressed():
	choixConvContainer[0].visible = true
	choixConvContainer[1].visible = false

func _on_CheckButtonConv2_pressed():
	choixConvContainer[1].visible = true
	choixConvContainer[0].visible = false
