extends Node

var show_button_delay := 2.0
var can_continue := false
const MENU_SCENE_PATH := "res://mainmenu.tscn"

func _ready() -> void:
	$Button.visible = false
	await get_tree().create_timer(show_button_delay).timeout
	$Button.text = "Aperte qualquer botão para iniciar"
	$Button.visible = true
	can_continue = true

func _input(event: InputEvent) -> void:
	if can_continue and (
		event is InputEventKey or
		event is InputEventMouseButton or
		event is InputEventJoypadButton
	):
		_go_to_main_menu()

func _go_to_main_menu() -> void:
	get_tree().change_scene_to_file(MENU_SCENE_PATH)
