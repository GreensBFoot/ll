extends Node2D


var a
@onready var label: Label = $Label
@onready var button: Button = $Button



func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://node_2d.tscn") # Replace with function body.
