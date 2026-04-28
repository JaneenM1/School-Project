extends CharacterBody2D

@onready var prompt_label = $PromptLabel
var player_in_range = false

@onready var order_label = $OrderLabel

func _ready():
	input_pickable = true
	prompt_label.visible = false
	order_label.visible = false


func _process(_delta):
	# --- DRAG SYSTEM ---
	if Global_Var.grabbed_one:
		var mouse_pos = get_global_mouse_position()
		global_position = lerp(global_position, mouse_pos, 0.2)
		
	# --- INTERACT (E KEY) ---
	if player_in_range and Input.is_action_just_pressed("Interact"):
		show_order()


func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if not event.pressed:
			if Global_Var.can_drop == true:
				if Global_Var.grabbed_one == true:
					Global_Var.grabbed_one = false
					queue_free()


func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			Global_Var.grabbed_one = true
			Global_Var.move_wait = true


#func _on_kitchen_mouse_entered() -> void:
	#pass #Replace with function body.

func _on_area_2d_body_entered(body):
	if body.name == "Player":
		player_in_range = true
		prompt_label.text = "Press E"
		prompt_label.visible = true


func _on_area_2d_body_exited(body):
	if body.name == "Player":
		player_in_range = false
		prompt_label.visible = false
		hide_order()


# --- ORDER SYSTEM ---
func show_order():
	order_label.text = "🍔"
	order_label.visible = true
	order_label.position = Vector2(0, -40)


func hide_order():
	order_label.visible = false
