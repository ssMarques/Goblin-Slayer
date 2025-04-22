extends Node2D

@onready var animate: AnimatedSprite2D = $Fireball/AnimatedSprite2D
@onready var explosion_area: Area2D = $Fireball/ExplosionArea

var speed := 400
var target_position := Vector2.ZERO
var exploded := false
var damage := 50

func _ready():
	animate.play("moving")
	explosion_area.monitoring = false
	explosion_area.monitorable = true  # Garante que a detecção funcione

func _process(delta):
	if exploded:
		return

	global_position = global_position.move_toward(target_position, speed * delta)

	if global_position.distance_to(target_position) < 5:
		explode()

func explode():
	exploded = true
	animate.play("exploding")
	explosion_area.monitoring = true  # Ativa a detecção de colisão

func _on_animated_sprite_2d_animation_finished():
	if animate.animation == "exploding":
		queue_free()

func _on_explosion_area_body_entered(body):
	if body.has_method("levar_dano"):
		body.levar_dano(damage)
