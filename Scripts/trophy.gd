extends Node2D

@export var target_level : PackedScene
@export var player_name := "CharacterBody2D" 

# Contador Trophy Flash
static var _flash_count := 0
static var _max_flashes := 2  

@onready var sprite_2d: AnimatedSprite2D = $Sprite2D

func _ready() -> void:
	if not is_in_group("trophy"):
		add_to_group("trophy")

func _on_body_entered(body: Node2D) -> void:
	if body == null:
		return
	if body.name != player_name:
		return

	# Animación
	if sprite_2d and (sprite_2d.animation != "Pressed" or not sprite_2d.is_playing()):
		sprite_2d.play("Pressed")

	# Flash
	if _flash_count < _max_flashes:
		var flash_node := get_tree().get_first_node_in_group("flash")
		if flash_node and flash_node is CanvasItem:
			_flash_count += 1   # incrementa el contador
			flash_node.modulate.a = 1.0
			var tw := flash_node.create_tween()
			tw.tween_property(flash_node, "modulate:a", 0.0, 0.25)
			tw.finished.connect(func ():
				flash_node.queue_free()
			)

	# Sonido + cambio de nivel
	$Winner.play()
	await get_tree().create_timer(1.0).timeout
	if target_level:
		get_tree().change_scene_to_packed(target_level)
