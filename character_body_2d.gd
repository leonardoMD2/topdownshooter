extends CharacterBody2D

@export var speed = 400
@export var characterLife:int = 10
@export var bullet:PackedScene
var shootTime = true

func get_input():
	look_at(get_global_mouse_position())
	var input_direction = Input.get_vector("izq", "der", "arriba", "abajo")
	velocity = input_direction * speed
	

	if Input.is_action_just_pressed("shoot") and shootTime:
		shoot()
		
func _physics_process(delta):
	get_input()
	move_and_slide()
	$Label.text = str(characterLife)
	if characterLife <= 0:
		$Label.text = "Muerto"
		
func shoot():
	
	var bulletIns = bullet.instantiate()
	#print(bulletIns.dir)
	bulletIns.global_position = $Marker2D.global_position
	bulletIns.dir = get_global_mouse_position() - $Marker2D.global_position
	get_parent().add_child(bulletIns)
	$AudioStreamPlayer2D.play()

	


func _on_area_2d_body_entered(body: Node2D) -> void:
	print(body.name)
	if body.is_in_group("enemy"):
		characterLife -= 1
