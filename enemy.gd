extends CharacterBody2D

var character
var life = 10
@export var speed = 100

func _ready() -> void:
	find_player()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if life < 0:
		queue_free()
	$Label.text = str(life)
	chase()
	
	move_and_slide()





func _on_area_2d_area_entered(area: Area2D) -> void:
	print(area.name) # Replace with function body.
	if area.name == "bulletHit":
		life -= 1

func chase():
	find_player()
	var direction = (character.position - position).normalized()
	velocity = direction * speed

func find_player():
	#Obtenemos el player a través del grupo (devuelve un array de coincidencias)
	character = get_tree().get_nodes_in_group("player")[0]
