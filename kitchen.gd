extends Area2D

func _on_mouse_entered() -> void:
	Global_Var.can_move = true
	
func _on_mouse_exited() -> void:
	Global_Var.can_move = false
