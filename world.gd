extends Node2D






	


func _on_plant_food_body_entered(body):
	get_tree().change_scene_to_file('res://End.tscn')
	


func _on_gem_2_body_entered(body):
	pass # Replace with function body.
