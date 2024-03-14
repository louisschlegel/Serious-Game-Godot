extends CheckBox

@onready var title:Label = get_node("Title")

func _on_button_down():
	get_parent().get_parent().get_parent().get_parent().handle_radio(title.get_text())
