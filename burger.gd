extends CharacterBody2D

@onready var player: CharacterBody2D = $"../../Player"
@onready var timer: Timer = $Timer

var new_target_pos = Vector2()
var speed = 700
var target_pos = Vector2()
var Interactable:bool
var Drop:bool

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("Pickup"):
		target_pos = new_target_pos
	
	if Interactable:
		Global_Var.holding_order = true
		new_target_pos = player.hold_pos
		if global_position.distance_to(target_pos) > 6:
			target_pos = (new_target_pos - global_position).normalized()
			velocity = target_pos * speed
		
	if Drop:
		Interactable = false
		global_position = Global_Var.chair_pos
		timer.start()
		
			
			
			
	move_and_slide()

func _on_timer_timeout() -> void:
	queue_free()
