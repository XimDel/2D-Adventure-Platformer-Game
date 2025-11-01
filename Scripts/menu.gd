extends Node
var ui_node 

func _ready(): 
	ui_node = get_node("/root/Ui") 
	ui_node.hide() 
	
func _exit_tree(): 
	ui_node.show()

func _on_nivel_1_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Level1.tscn")

func _on_nivel_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Level2.tscn")
