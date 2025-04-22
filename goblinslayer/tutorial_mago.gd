extends Control

signal tutorial_finalizado

@onready var falas = [
	"Olá, jovem guerreiro!",
	"Prepare-se para enfrentar ondas de inimigos.",
	"Eles surgem pela esquerda e seguem o caminho até o fim.",
	"Você pode se defender disparando bolas de fogo com o clique esquerdo do mouse.",
	"Boa sorte! Agora vá e proteja o reino!"
]

@onready var label = $Label
@onready var botao = $Button
@onready var mago = $TextureRect

var indice_fala = 0

func _ready():
	mostrar_fala()

func mostrar_fala():
	label.text = falas[indice_fala]

func _on_Button_pressed():
	indice_fala += 1
	if indice_fala < falas.size():
		mostrar_fala()
	else:
		emit_signal("tutorial_finalizado")
		queue_free()  # Remove o tutorial da tela
