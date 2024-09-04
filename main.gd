extends Node2D

@export var enemyScene:PackedScene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$TimerSpawn.start() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$CanvasLayer/Label2.text = str(round($TimerSpawn.time_left))


func _on_timer_spawn_timeout() -> void:
	enemySpawn()

func enemySpawn():
	var enemyIns = enemyScene.instantiate()
	#print(enemyIns.dir)
	enemyIns.global_position = $Spawner.global_position
	get_parent().add_child(enemyIns)
	enemyIns.find_player()
