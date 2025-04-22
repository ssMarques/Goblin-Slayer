extends Camera2D

@export var zoom_speed := 0.1
@export var min_zoom := 0.5
@export var max_zoom := 2.0
@export var map_bounds := Rect2(Vector2(0, 0), Vector2(2000, 2000))

var dragging := false
var last_mouse_position := Vector2.ZERO

func _input(event):
	# Controle de Zoom com a Roda do Mouse
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			zoom *= 1 - zoom_speed
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			zoom *= 1 + zoom_speed
			
		zoom.x = clamp(zoom.x, min_zoom, max_zoom)
		zoom.y = clamp(zoom.y, min_zoom, max_zoom)

	# Iniciar o arrasto da câmera com botão direito agora
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT:
		dragging = event.pressed
		last_mouse_position = get_global_mouse_position()
	
	# Movimento da câmera ao arrastar
	if event is InputEventMouseMotion and dragging:
		var delta = last_mouse_position - get_global_mouse_position()
		position += delta
		position = position.clamp(map_bounds.position, map_bounds.end)
		last_mouse_position = get_global_mouse_position()
