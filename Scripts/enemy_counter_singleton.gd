extends Node

signal enemy_spawned
signal enemy_died

var enemy_count: int = 0

# Function to call when an enemy spawns
func on_enemy_spawned():
	enemy_count += 1
	enemy_spawned.emit(enemy_count)

# Function to call when an enemy dies
func on_enemy_died():
	enemy_count -= 1
	enemy_died.emit(enemy_count)


func get_enemy_count() -> int:
	return enemy_count
