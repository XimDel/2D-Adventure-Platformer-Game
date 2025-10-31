extends Area2D
#@onready var game_manager = $"/root/Node/GameManager"

func _on_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D"):
		$CollectItem.play()
		SingleGameManager.add_puntos()
		await get_tree().create_timer(0.1).timeout
		queue_free() # eliminarlo
		
