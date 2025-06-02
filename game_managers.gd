extends Node2D
@onready var score1=0
@onready var score2=0
@onready var pong: CharacterBody2D = $"../Pong"
var ans:String
@onready var label: Label = $"../Label"
signal a
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	ans=("Score\n"+" "+str(score1)+"-"+str(score2))
	label.text=ans
	if score1>4:
		get_tree().change_scene_to_file("res://node_2d1.tscn")
		a.emit()
	if score2>4:
		get_tree().change_scene_to_file("res://node_2d3.tscn")
		a.emit()
	






func _on_area_2d_2_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	score2+=1 # Replace with function body.
	print(score1)
	print(score2) # Replace with function body.


func _on_area_2d_3_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	score1+=1 # Replace with function body.
	print(score1)
	print(score2)# Replace with function body.
	


func _on_area_2d_3_body_entered(body: Node2D) -> void:
	score2+=1 # Replace with function body.
	print(score1)
	print(score2) # Replace with function body.
	pong.position.x=0
	pong.position.y=0
	pong.speed=300

func _on_area_2d_2_body_entered(body: Node2D) -> void:
	score1+=1 # Replace with function body.
	print(score1)
	print(score2) # Replace with function body.
	pong.position.x=0
	pong.position.y=0
	pong.speed=300
