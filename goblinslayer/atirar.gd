extends Button

@onready var tower: Node2D = $"../Tower"


func _ready():
	self.pressed.connect(_on_button_pressed)  # Conectar o evento de clique ao método

func _on_button_pressed():
	if tower and tower.has_method("shoot"):
		tower.shoot()  # Chama a função shoot() da torre
