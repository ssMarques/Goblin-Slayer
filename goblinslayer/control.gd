extends Control

func _on_start_pressed():
	var loading_screen = load("res://loading_screen.tscn").instantiate()
	add_child(loading_screen)  # Adiciona a tela de loading
	loading_screen.start_loading("res://stage_1.tscn")  # Carrega a fase 1
