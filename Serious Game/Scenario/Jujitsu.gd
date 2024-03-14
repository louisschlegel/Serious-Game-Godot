extends Node2D
@onready var phone = $Phone
@onready var player = $Player
@onready var inventaire = MainUI.get_node("Inventory")
@onready var doorCol = $door/CollisionShape2D
@onready var spritePlayer = $Player/Sprite2D
@onready var popUp = MainUI.get_child(0)
	
func _ready():
	phone.choixConv = ["Marc"]
	inventaire.add_item("phoneOn")
	spritePlayer.texture = preload("res://Asset/PNJ/Joueur_jujitsu.png")
	popUp.show_message(1)
	
	
	
func _physics_process(delta):
	phone.position = player.position + Vector2(100,0)


func _on_tp_fin_area_entered(area):
	get_parent().go_to_recap(name)


func _on_ami_fin_ami():
	popUp.show_message(5)
	doorCol.disabled = true

func set_belt():
	spritePlayer.texture = preload("res://Asset/PNJ/Joueur_jujitsu_ceinture.png")
