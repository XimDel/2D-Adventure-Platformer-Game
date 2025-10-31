extends Node2D
@onready var points_label = $"/root/Node/UI/Panel/PointsLabel"
@onready var texture_progress_bar = $"/root/Node/UI/TextureRect/TextureProgressBar"

var puntos = 0

func add_puntos():
	puntos += 1
	print(puntos)
	points_label.text = "Puntos: " + str(puntos)
	texture_progress_bar.value += 1
