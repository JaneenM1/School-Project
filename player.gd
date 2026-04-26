
extends CharacterBody2D

@export var speed: float = 220.0

var target_position: Vector2
var moving := false

func _ready():
	target_position = global_position

func _unhandled_input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var space_state = get_world_2d().direct_space_state
		
		# Cast ray from mouse click
		var query = PhysicsPointQueryParameters2D.new()
		query.position = get_global_mouse_position()
		query.collide_with_areas = true
		query.collide_with_bodies = true
		
		var result = space_state.intersect_point(query)
		
		# If clicked on a collider
		if result.size() > 0:
			target_position = get_global_mouse_position()
			moving = true

func _physics_process(delta):
	if moving:
		var direction = target_position - global_position
		
		if direction.length() > 5:
			velocity = direction.normalized() * speed
			move_and_slide()
		else:
			velocity = Vector2.ZERO
			moving = false
