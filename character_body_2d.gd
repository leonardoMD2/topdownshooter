extends CharacterBody2D

@export var speed = 400
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
	
func shoot():
	
	var bulletIns = bullet.instantiate()
	#print(bulletIns.dir)
	bulletIns.global_position = $Marker2D.global_position
	bulletIns.dir = get_global_mouse_position() - $Marker2D.global_position
	get_parent().add_child(bulletIns)
	$AudioStreamPlayer2D.play()

	
