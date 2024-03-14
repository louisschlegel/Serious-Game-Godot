extends VideoStreamPlayer

func _ready():
	pass
func _process(delta):
	var isPlaying = is_playing()
	if isPlaying == false:
		play()
