extends Node2D

@export var fireball_scene: PackedScene
@export var enemy_scene: PackedScene  # Novo: cena do inimigo

var inimigo_timer: Timer

func _ready():
	if fireball_scene == null:
		fireball_scene = load("res://fireball.tscn")

	if enemy_scene == null:
		enemy_scene = load("res://Enemy.tscn")  # Ajuste conforme o nome do seu arquivo

	# Cria e configura o timer para spawn de inimigos
	inimigo_timer = Timer.new()
	inimigo_timer.wait_time = 2.0
	inimigo_timer.one_shot = false
	inimigo_timer.autostart = true
	inimigo_timer.timeout.connect(_on_inimigo_timer_timeout)
	add_child(inimigo_timer)

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		voltar_para_menu()

func voltar_para_menu():
	print("Voltando ao menu principal...")
	get_tree().change_scene_to_file("res://mainmenu.tscn")

func _unhandled_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		spawn_fireball(get_global_mouse_position())

func spawn_fireball(target_position: Vector2):
	var fireball = fireball_scene.instantiate()
	fireball.global_position = Vector2(target_position.x, 0)  # Spawn no topo
	fireball.target_position = target_position
	add_child(fireball)

func _on_inimigo_timer_timeout():
	spawn_enemy()

func spawn_enemy():
	var enemy = enemy_scene.instantiate()
	enemy.global_position = Vector2(0, 400)  # Ponto inicial do inimigo
	enemy.caminho = [Vector2(0, 400), Vector2(700, 400)]  # Caminho simples horizontal
	add_child(enemy)
