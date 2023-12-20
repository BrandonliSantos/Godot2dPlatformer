extends Node
@onready var points_label = %PointsLabel
var points = 0

func add_point():
	points+=1
	points_label.text = "Points: " + str(points)

func change_level():
	get_tree().change_scene_to_file("res://scenes/level2.tscn")
