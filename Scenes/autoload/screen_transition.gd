extends CanvasLayer

signal transitioned_halfway

@onready var animation_player: AnimationPlayer = $AnimationPlayer

var skip_emit = false


func transition():
	$ColorRect.visible = true
	animation_player.play("default")
	await animation_player.animation_finished
	transitioned_halfway.emit()
	animation_player.play_backwards("default")
	await animation_player.animation_finished
	$ColorRect.visible = false


func transition_to_scene(scene_path: String):
	transition()
	await transitioned_halfway
	# to avoid the data tree is null error
	await get_tree().create_timer(0.3).timeout
	get_tree().change_scene_to_file(scene_path)
	EnemyCounterSingleton.enemy_count = 0


func emit_transitioned_halfway():
	if skip_emit:
		skip_emit = false
		return
	
	transitioned_halfway.emit()
