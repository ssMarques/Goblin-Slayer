extends Sprite2D
@export var speed := 30.0  # velocidade da nuvem

func _process(delta):
	position.x += speed * delta  # move a nuvem para a direita
	if position.x > get_viewport_rect().size.x + texture.get_width():
		position.x = -texture.get_width()  # volta do lado esquerdo da tela
