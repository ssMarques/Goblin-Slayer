extends Node2D

@export var fireball_scene: PackedScene
@export var enemy_scene: PackedScene

@onready var hud = $HUD
var tempo_restante := 10  # segundos
var tempo_spawn := 10.0
var tempo_passado := 0.0

func _ready():
	if fireball_scene == null:
		fireball_scene = load("res://fireball.tscn")
	if enemy_scene == null:
		enemy_scene = load("res://enemy.tscn")

	# Timer para atualizar o contador a cada segundo (HUD)
	var contador_timer = Timer.new()
	contador_timer.wait_time = 1.0
	contador_timer.one_shot = false
	contador_timer.autostart = true
	contador_timer.timeout.connect(_atualizar_contador)
	add_child(contador_timer)

	# Atualiza a HUD com o tempo inicial
	hud.atualizar_contador(tempo_restante)

func _process(delta):
	tempo_passado += delta
	if tempo_passado >= tempo_spawn:
		spawn_enemy()
		tempo_passado = 0.0
		tempo_restante = int(tempo_spawn)
		hud.atualizar_contador(tempo_restante)

	if Input.is_action_just_pressed("ui_cancel"):
		voltar_para_menu()

func _atualizar_contador():
	if tempo_restante > 0:
		tempo_restante -= 1
		hud.atualizar_contador(tempo_restante)

func _unhandled_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		var mouse_pos = get_global_mouse_position()
		spawn_fireball(mouse_pos)

func spawn_fireball(target_position: Vector2):
	var fireball = fireball_scene.instantiate()
	fireball.global_position = Vector2(target_position.x, 0)
	fireball.target_position = target_position
	add_child(fireball)

func voltar_para_menu():
	get_tree().change_scene_to_file("res://mainmenu.tscn")

func spawn_enemy():
	var enemy = enemy_scene.instantiate()
	enemy.global_position = Vector2(-200, -1)
	enemy.set_caminho([
		Vector2(-10, 1000),
		Vector2(100, 990),
		Vector2(200, 1010),
		Vector2(300, 995),
		Vector2(400, 1005),
		Vector2(500, 1000),
		Vector2(700, 1010),
		Vector2(900, 990),
		Vector2(1100, 1005),
		Vector2(1300, 995),
		Vector2(1600, 1010),
		Vector2(1800, 1000),
		Vector2(2000, 1000)
	])

	# Referência à HUD para perda de vida
	enemy.vida_jogador = hud
	add_child(enemy)
