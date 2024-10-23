extends Node2D

@export var enemyScene:PackedScene
<<<<<<< HEAD
@export var bossScene:PackedScene

var spawnBoss: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$TimerSpawn.start() # Replace with function body.
	$TimerSpawnBoss.start()
=======
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$TimerSpawn.start() # Replace with function body.

>>>>>>> 1861ef25fab010747902994dd512815de06066e8

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$CanvasLayer/Label2.text = str(round($TimerSpawn.time_left))
<<<<<<< HEAD
	$CanvasLayer/Label4.text = str(GlobalScript.points)

func _on_timer_spawn_timeout() -> void:
	if not spawnBoss:
		enemySpawn()
	
		
		
func enemySpawn():
	var enemyIns = enemyScene.instantiate()
	#print(enemyIns.dir)
	var spawners = [$Spawner,$Spawner2,$Spawner3,$Spawner4]
	var randomChoice = randi_range(0,3)
	enemyIns.global_position = spawners[randomChoice].global_position
	get_parent().add_child(enemyIns)
	enemyIns.findPlayer()

func bossSpawn():
	var bossIns = bossScene.instantiate()
	#print(enemyIns.dir)
	var spawners = [$Spawner,$Spawner2,$Spawner3,$Spawner4]
	var randomChoice = randi_range(0,3)
	bossIns.global_position = spawners[randomChoice].global_position
	get_parent().add_child(bossIns)
	bossIns.findPlayer()

func _on_timer_spawn_boss_timeout() -> void:
	spawnBoss = true
	bossSpawn()
	spawnBoss = false
=======


func _on_timer_spawn_timeout() -> void:
	enemySpawn()

func enemySpawn():
	var enemyIns = enemyScene.instantiate()
	#print(enemyIns.dir)
	enemyIns.global_position = $Spawner.global_position
	get_parent().add_child(enemyIns)
	enemyIns.findPlayer()
>>>>>>> 1861ef25fab010747902994dd512815de06066e8
