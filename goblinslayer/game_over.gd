extends Control

func _ready():
	# Conecta os botões às funções
	$VBoxContainer/"Tentar Novamente".connect("pressed", Callable(self, "_on_retry_pressed"))
	$VBoxContainer/"Voltar ao Menu".connect("pressed", Callable(self, "_on_menu_pressed"))
	$VBoxContainer/"Sair".connect("pressed", Callable(self, "_on_exit_pressed"))

func _on_retry_pressed():
	get_tree().change_scene_to_file("res://stage1.tscn")

func _on_menu_pressed():
	get_tree().change_scene_to_file("res://mainmenu.tscn")

func _on_exit_pressed():
	get_tree().quit()
