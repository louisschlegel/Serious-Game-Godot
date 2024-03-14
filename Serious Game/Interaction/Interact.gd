extends Area2D

var DialogueBox = MainUI.get_node("DialogueBox")
var loadInteractAnim
var spriteEAnim
var canInteract:bool = false
var player = null

func _ready():
	loadInteractAnim = preload("res://Interaction/interagir.tscn") # Load la scène de la touche E
	ready_child()

func _input(event):
	if(canInteract and event.is_action_pressed("interact")): # Test si la touche E est appuyé
		interact()

func _on_area_entered(area):
	player = area.get_parent()
	
	if(player == get_parent()):
		return
	
	spriteEAnim = loadInteractAnim.instantiate()
	spriteEAnim.position += Vector2(0,-40)
	player.add_child(spriteEAnim)
	canInteract = true

func _on_area_exited(_area):
	delete_interact()

func interact():
	pass

func delete_interact():
	if(spriteEAnim != null):
		spriteEAnim.queue_free()
		canInteract = false

func ready_child():
	pass
