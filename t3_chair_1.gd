extends AnimatedSprite2D


var order_up:bool

@onready var Chair_1: Marker2D = $"1"
@onready var Chair_2: Marker2D = $"2"
@onready var Chair_3: Marker2D = $"3"
@onready var Chair_4: Marker2D = $"4"

@onready var burger: CharacterBody2D = $"../../Food/Burger"
@onready var player: CharacterBody2D = $"../../Player"
@onready var debug: Label = $Debug




func _process (_delta):
	
	if order_up and Global_Var.holding_order:
		
		match Global_Var.at_chair:
			
			1:
				Global_Var.holding_order = false
				Global_Var.chair_pos = Chair_1.global_position
				burger.Drop = true
				burger.Interactable = false
				
			2:
				Global_Var.holding_order = false
				Global_Var.chair_pos = Chair_2.global_position
				burger.Drop = true
				burger.Interactable = false
				
			3:
				Global_Var.holding_order = false
				Global_Var.chair_pos = Chair_3.global_position
				burger.Drop = true
				burger.Interactable = false
				
			4:
				Global_Var.holding_order = false
				Global_Var.chair_pos = Chair_4.global_position
				burger.Drop = true
				burger.Interactable = false
				
				
	
	
	
	if Global_Var.at_table_3 == true:
			frame = 1




	match order_up:
		true:
			debug.text = "Order up"
		false:
			debug.text = ""




func _on_prox_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		order_up = true
		Global_Var.holding_order = false





func _on_prox_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		order_up = false
