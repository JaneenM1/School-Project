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
		move_and_slide()
		new_target_pos = player.hold_pos
		if global_position.distance_to(target_pos) > 6:
			target_pos = (new_target_pos - global_position).normalized()
			velocity = target_pos * speed
		
	if Drop:
		
		timer.start()
		speed = 0
		
			
			
			
			


func _on_timer_timeout() -> void:
	queue_free()
