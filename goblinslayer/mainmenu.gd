extends Control

# Caminho da cena de história que será exibida antes do jogo começar
const HISTORIA_SCENE_PATH := "res://historia.tscn"

# Caminho do arquivo de salvamento (pode ser usado futuramente)
const SAVE_FILE_PATH := "user://savegame.dat"

# Função chamada quando a cena é carregada
func _ready() -> void:
	# Aqui você pode adicionar coisas como:
	# carregar dados salvos, configurar música de fundo, etc.
	pass

# Botão "Iniciar" pressionado
func _on_iniciar_btn_pressed() -> void:
	# Vai para a cena de história em vez de ir direto para a fase
	get_tree().change_scene_to_file(HISTORIA_SCENE_PATH)

# Botão "Sair" pressionado
func _on_sair_btn_pressed() -> void:
	# Encerra o jogo
	get_tree().quit()
