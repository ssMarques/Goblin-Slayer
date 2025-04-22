extends Button

func _ready():
	connect("pressed", Callable(self, "_on_pressed"))
