extends Node2D

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

@export var speed: float = 220.0
@export var vida: int = 100

var caminho: Array = []
var ponto_atual: int = 0
var vida_jogador = null  # Referência à HUD para chamar perder_vida()

func _ready():
	if anim == null:
		print("❌ Erro: AnimatedSprite2D não encontrado!")
	else:
		anim.play("Andar")

func _process(delta):
	if ponto_atual >= caminho.size():
		chegou_ao_final()
		return

	var alvo = caminho[ponto_atual]
	var direcao = (alvo - global_position).normalized()
	global_position += direcao * speed * delta

	if direcao.x != 0:
		anim.flip_h = direcao.x < 0

	if global_position.distance_to(alvo) < 5:
		ponto_atual += 1

func levar_dano(valor):
	vida -= valor
	if vida <= 0:
		queue_free()

func set_caminho(pontos: Array):
	caminho = pontos
	ponto_atual = 0

func chegou_ao_final():
	if vida_jogador != null:
		vida_jogador.perder_vida()
	queue_free()
