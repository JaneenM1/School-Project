extends Area2D

@onready var prompt_label = $FoodPrompt
@onready var request_label = $FoodLabel

var player_in_range = false
var has_active_request = false

var foods = ["Burger", "Pizza", "Salad"]  # you can expand this

func _ready():
	prompt_label.visible = false
	request_label.visible = false


func _process(_delta):
	if player_in_range and Input.is_action_just_pressed("Interact"):
		if !has_active_request:
			create_request()


func create_request():
	var food = foods.pick_random()
	request_label.text = "Order: " + food
	request_label.visible = true
	has_active_request = true


# Detect player entering range
func _on_body_entered(body):
	if body.name == "Player":
		player_in_range = true
		prompt_label.visible = true


func _on_body_exited(body):
	if body.name == "Player":
		player_in_range = false
		prompt_label.visible = false
