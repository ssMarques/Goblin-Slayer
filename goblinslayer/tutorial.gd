extends Node2D

@onready var tutorial_canvas = $TutorialCanvas
@onready var fechar_button = $TutorialCanvas/Panel/FecharButton

func _ready():
	if tutorial_canvas and fechar_button:
		mostrar_tutorial()
	else:
		print("Erro: Não foi possível localizar TutorialCanvas ou FecharButton.")

func mostrar_tutorial():
	tutorial_canvas.visible = true
	fechar_button.pressed.connect(_on_fechar_tutorial)

func _on_fechar_tutorial():
	tutorial_canvas.visible = false
