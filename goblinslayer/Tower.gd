extends Node2D

@export var bullet_scene: PackedScene  # Cena do projétil

func shoot():
	if bullet_scene:
		print("Disparando projétil!")  # Verifica se a função foi chamada
		var bullet = bullet_scene.instantiate()  # Cria o projétil
		bullet.global_position = self.position  # Define a posição inicial
		if bullet.has_method("set_direction"):
			bullet.set_direction(Vector2.RIGHT)  # Define a direção do projétil
		get_tree().current_scene.add_child(bullet)  # Adiciona o projétil à cena
	else:
		print("bullet_scene não está configurado!")  # Verifica se a variável está vazia


func _on_attack_range_body_entered(body: Node2D) -> void:
	pass
