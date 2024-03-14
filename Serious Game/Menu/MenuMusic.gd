extends AudioStreamPlayer2D

func _process(_delta):
	var isPlaying = is_playing()
	if isPlaying == false:
		play()
