extends Node

var points_label 
var texture_progress_bar 
var puntos = 0

func _ready():
	points_label = get_node("/root/Ui/Panel/PointsLabel")
	texture_progress_bar = get_node("/root/Ui/TextureRect/TextureProgressBar")

func add_puntos():
	puntos += 1
	print(puntos)
	points_label.text = "Puntos: " + str(puntos)
	texture_progress_bar.value += 1
