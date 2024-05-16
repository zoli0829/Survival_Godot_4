extends Label

@onready var enemy_counter = $"."

func _ready():
	# Connect the signals from the singleton
	EnemyCounterSingleton.connect("enemy_spawned", _on_enemy_count_changed)
	EnemyCounterSingleton.connect("enemy_died", _on_enemy_count_changed)
	
	# Update the label initially
	_update_enemy_label(EnemyCounterSingleton.enemy_count)

# Function to handle signal when enemy count changes
func _on_enemy_count_changed(new_count):
	_update_enemy_label(new_count)

# Function to update the label text
func _update_enemy_label(count):
	enemy_counter.text = "Enemies: " + str(count)
