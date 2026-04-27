extends Area2D

func _on_mouse_entered() -> void:
	Global_Var.can_drop = true
	Global_Var.can_move = true

func _on_mouse_exited() -> void:
	Global_Var.can_drop = false
	Global_Var.at_table_2 = false
	Global_Var.can_move = false

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			if Global_Var.can_drop == true:
				if Global_Var.grabbed_one == true or Global_Var.grabbed_two == true:
					if Global_Var.table2_available == true:
						Global_Var.at_table_2 = true
