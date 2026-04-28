extends CharacterBody2D

@export var speed = 400

var target

func _ready():
	target = global_position

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		target = get_global_mouse_position()

func _physics_process(_delta):
	velocity = global_position.direction_to(target) * speed
	if global_position.distance_to(target) > 10:
		move_and_slide()
