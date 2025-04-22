extends Button

func _ready():
	connect("pressed", Callable(self, "_on_pressed"))

func _on_pressed():
	print("Abrindo configurações...")
	get_tree().change_scene_to_file("res://caminho/para/sua/cena_configuracoes.tscn")
