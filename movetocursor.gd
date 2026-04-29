extends CharacterBody2D

var speed = 1000
var click_pos = Vector2()
var target_pos = Vector2()

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("click"):
		click_pos = get_global_mouse_position()
	
	if position.distance_to(click_pos) > 10:
		target_pos = (click_pos - position).normalized()
		velocity = target_pos * speed
		move_and_slide()
