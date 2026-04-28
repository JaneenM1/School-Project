extends CharacterBody2D

func _ready():
	input_pickable = true

func _process(_delta):
	if Global_Var.grabbed_two:
		var mouse_pos = get_global_mouse_position()
		global_position = lerp(global_position, mouse_pos, 0.2)

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if not event.pressed:
			if Global_Var.can_drop == true:
				if Global_Var.grabbed_two == true:
					if Global_Var.at_table_1 or Global_Var.at_table_2 or Global_Var.at_table_3:
						queue_free()
						Global_Var.grabbed_two = false

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			Global_Var.grabbed_two = true
