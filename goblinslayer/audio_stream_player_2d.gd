extends AudioStreamPlayer2D

func _ready():
	play()  # Começa a tocar a música
	connect("finished", Callable(self, "_on_AudioStreamPlayer2D_finished"))

func _on_AudioStreamPlayer2D_finished():
	play()  # Reinicia a música ao terminar
