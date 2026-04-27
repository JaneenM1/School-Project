extends AnimatedSprite2D

func _process (_delta):
	if Global_Var.grabbed_two == true:
		if Global_Var.at_table_2 == true:
			frame = 1
