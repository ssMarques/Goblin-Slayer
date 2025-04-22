extends Node2D

@export var speed := 400  # Velocidade do projétil
var direction := Vector2.RIGHT  # Direção padrão

# Função para definir a direção do projétil
func set_direction(new_direction: Vector2):
	direction = new_direction

# Função que faz o projétil se mover
func _process(delta: float):
	position += direction * speed * delta  # Movimenta o projétil
	print("Movendo projétil para: ", position)  # Verifica se o projétil está se movendo
