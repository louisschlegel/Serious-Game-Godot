extends Node2D

var valueLabel
var slider

func _ready():
	valueLabel = $Value
	slider = $HSlider
	valueLabel.text = str(slider.value)


func _on_h_slider_value_changed(value):
	valueLabel.text = str(value)
