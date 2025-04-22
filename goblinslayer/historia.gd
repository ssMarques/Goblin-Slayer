extends Node  # ou Control, se estiver usando elementos de UI

var show_button_delay := 2.0
var can_continue := false
const STAGE1_SCENE_PATH := "res://STAGE1.tscn"  # Ajuste se o caminho for diferente

func _ready() -> void:
	$Button.visible = false
	await get_tree().create_timer(show_button_delay).timeout
	$Button.text = "Aperte qualquer botão para continuar"
	$Button.visible = true
	can_continue = true

func _input(event: InputEvent) -> void:
	if can_continue and (
		event is InputEventKey or
		event is InputEventMouseButton or
		event is InputEventJoypadButton
	):
		_go_to_stage1()

func _go_to_stage1() -> void:
	get_tree().change_scene_to_file(STAGE1_SCENE_PATH)
