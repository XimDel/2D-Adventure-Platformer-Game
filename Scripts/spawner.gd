extends Node2D

@onready var cherry = load("res://Scenes/collectible.tscn")
@onready var timer = get_node("Timer")

func _ready():
	timer.stop()
	timer.wait_time = randf_range(3, 5)
	timer.start()

func spawn():
	var inst = cherry.instantiate()
	add_child(inst)
	# Conectamos la señal personalizada del coleccionable
	if inst.has_signal("collected"):
		inst.connect("collected", Callable(self, "_on_collectible_collected"))
	# Pausamos el timer hasta que el jugador lo recoja
	timer.stop()

func _on_timer_timeout():
	spawn()

func _on_collectible_collected():
	# Cuando el jugador recoge el objeto, reactivamos el Timer
	timer.wait_time = randf_range(3, 5)
	timer.start()
