extends Camera2D




func _on_cam_1_trans_body_exited(_body):
	position.x=0


func _on_cam_2_trans_body_exited(_body):
	position.x=1289
	zoom.x = 1.37


func _on_cam_3_trans_body_exited(_body):
	position.x=2555
	zoom.x = 2.05


func _on_cam_4_trans_body_exited(_body):
	position.y = 485
	zoom.y = 0.99
	zoom.x= 1.002
	position.x = 2555


func _on_cam_5_trans_body_exited(_body):
	position.y = 1155
	zoom.y = 2.9
	zoom.x= 1.47
	position.x = 1327
	
	
