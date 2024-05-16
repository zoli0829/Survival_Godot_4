extends Label
@onready var enemy_manager = $"../.."

func _ready():
	pass


func _process(_delta):
	var enemies = enemy_manager.enemies_array.size()
	
	text = "Enemies: " +str(enemies)
	
