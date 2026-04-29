extends CharacterBody2D
var speed = 700
var click_pos = Vector2()
var target_pos = Vector2()
var hold_pos = Vector2()
var holding_order:bool

@onready var what_table: Label = $"What table"
@onready var burger: CharacterBody2D = $"../Food/Burger"
@onready var marker: Marker2D = $Marker2D
@onready var kitchen_station: Area2D = $"../KitchenStation"

func _physics_process(_delta: float) -> void:
	hold_pos = marker.global_position
	#print(var_to_str(at_chair))
	
	
	
	if Input.is_action_just_pressed("click"):
		click_pos = get_global_mouse_position()
	
	if global_position.distance_to(click_pos) > 6:
		target_pos = (click_pos - global_position).normalized()
		velocity = target_pos * speed
		move_and_slide()


func _on_kitchen_station_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		kitchen_station.prompt_label.visible= true
		burger.Interactable = true


func _on_kitchen_station_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		kitchen_station.prompt_label.visible= false
		burger.Interactable = true


func _on_prox_1_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		what_table.text = "Chair 1"
		Global_Var.at_chair = 1
		if holding_order:
			burger.global_position = Global_Var.chair_pos
func _on_prox_2_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		what_table.text = "Chair 2"
		Global_Var.at_chair = 2
		if holding_order:
			burger.global_position = Global_Var.chair_pos
func _on_prox_3_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		what_table.text = "Chair 3"
		Global_Var.at_chair = 3
		if holding_order:
			burger.global_position = Global_Var.chair_pos
func _on_prox_4_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		what_table.text = "Chair 4"
		Global_Var.at_chair = 4
		if holding_order:
			burger.global_position = Global_Var.chair_pos
