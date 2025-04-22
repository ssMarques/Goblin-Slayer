extends CanvasLayer

var vida: int = 5
var dinheiro: int = 0
var kills: int = 0

@onready var contador_label: Label = $MarginContainer/HBoxContainer/ContadorLabel

func _ready():
	atualizar_hud()

func atualizar_hud():
	$MarginContainer/HBoxContainer/LabelVida.text = "❤️ Vida: " + str(vida)
	$MarginContainer/HBoxContainer/LabelDinheiro.text = "💰 Dinheiro: " + str(dinheiro)
	$MarginContainer/HBoxContainer/LabelKills.text = "☠️ Kills: " + str(kills)

func set_vida(valor):
	vida = valor
	atualizar_hud()

func set_dinheiro(valor):
	dinheiro = valor
	atualizar_hud()

func set_kills(valor):
	kills = valor
	atualizar_hud()

func perder_vida():
	vida -= 1
	atualizar_hud()
	if vida <= 0:
		get_tree().change_scene_to_file("res://game_over.tscn")

func atualizar_contador(valor: int):
	if valor > 0:
		contador_label.text = "Inimigo aparece em: " + str(valor)
	else:
		contador_label.text = ""
