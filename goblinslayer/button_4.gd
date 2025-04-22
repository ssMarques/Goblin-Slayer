extends Button

const SAVE_FILE_PATH = "user://savegame.dat"

func _ready():
	connect("pressed", Callable(self, "_on_pressed"))

func _on_pressed():
	print("Carregando jogo salvo...")
	var save_data = load_game()
	if save_data and "scene" in save_data:
		get_tree().change_scene_to_file(save_data["scene"])
	else:
		print("Nenhum jogo salvo encontrado.")

func load_game():
	var file = FileAccess.open(SAVE_FILE_PATH, FileAccess.READ)
	if file:
		var data = file.get_as_text()
		file.close()
		return JSON.parse_string(data) if data else null
	return null
