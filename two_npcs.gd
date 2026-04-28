extends CharacterBody2D

@onready var prompt_label = $Label
var player_in_range = false

func _ready():
	input_pickable = true

func _process(_delta):
	if Global_Var.grabbed_two:
		var mouse_pos = get_global_mouse_position()
		global_position = lerp(global_position, mouse_pos, 0.2)

func _input(event):
	if event is InputEventMouseButton and event.button_index and event.button_index == MOUSE_BUTTON_LEFT:
		if not event.pressed:
			if Global_Var.can_drop == true:
				if Global_Var.grabbed_two == true:
					Global_Var.grabbed_two = false
					queue_free()

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			Global_Var.grabbed_two = true
			Global_Var.move_wait = true


# --- PROXIMITY ENTER ---
func _on_area_2d_body_entered(body):
	if body.name == "Player":
		player_in_range = true
		prompt_label.text = "Press E to interact"
		prompt_label.visible = true


# --- PROXIMITY EXIT ---
func _on_area_2d_body_exited(body):
	if body.name == "Player":
		player_in_range = false
		prompt_label.visible = false


func show_order():
	print("Order / dialogue triggered here")
