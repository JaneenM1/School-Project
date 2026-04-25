# CustomerSpawner.gd
extends Node2D

@export var customer_scene: PackedScene = preload("res://customernpc.tscn")
@onready var spawntimer: Timer = $SpawnPoints/SpawnTimer
@onready var closertimer: Timer = $"../CloserSpawner/Spawnpoint2/Closertimer"
@onready var spots = [$Spot1, $Spot2, $Spot3]

func _ready(): 
	spawn_customer()
	
func spawn_customer():
	var empty_spot = null
	for spot in spots:
		if spot.get_child_count() == 0: 
			empty_spot = spot
			break
	
	# 2. Only spawn if there is a spot in line
	if empty_spot:
		var group_size = randi_range(1, 4)
		for i in range(group_size):
			var npc = customer_scene.instantiate()
			# Spawn them off-screen or at the door
			npc.global_position = Vector2(-50, 0) 
			
			# Give them the spot to walk to
			npc.target_spot = empty_spot
			
			# To track the spot, we can make the NPC a child or use a variable
			empty_spot.add_child(npc)
			
			# Add a tiny delay so they don't overlap perfectly
			await get_tree().create_timer(0.2).timeout


func _on_spawn_timer_timeout() -> void:
	spawn_customer()
	#$SpawnPoints/DebugBeep.play()
