extends AnimatedSprite2D


var order_up:bool
@onready var Chair_1: Marker2D = $"1"

@onready var burger: CharacterBody2D = $"../../Food/Burger"
@onready var player: CharacterBody2D = $"../../Player"
@onready var debug: Label = $Debug

func _process (_delta):
	
	if order_up:
		match Global_Var.at_chair:
			1:
				burger.Interactable = false

			#2:
				#burger.new_target_pos = Chair_2.global_position
			#3:
				#burger.new_target_pos = Chair_3.global_position
			#4:
				#burger.new_target_pos = Chair_4.global_position
				
	
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


func _on_prox_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		order_up = false
