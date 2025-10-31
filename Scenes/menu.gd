extends Node

func _on_nivel_1_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Level1.tscn")

func _on_nivel_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Level2.tscn")
