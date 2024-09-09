extends CharacterBody2D

var character
var life = 10
@export var speed = 100
@export var explosion: PackedScene
#@export var explosionDeath: PackedScene

func _ready() -> void:
	findPlayer()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if life < 0:
	
		tweenDisapear()
		
	$Label.text = str(life)
	chase()
	
	move_and_slide()





func _on_area_2d_area_entered(area: Area2D) -> void:

	if area.name == "bulletHit":
		var particle = explosion.instantiate()
		#print(bulletIns.dir)
		self.add_child(particle)
		particle.global_position = self.global_position
		particle.emitting = true
		tweenHit()
		tweenKnockback()
		$AudioStreamPlayer2D.play()
		life -= 1

func chase():
	findPlayer()
	var direction = (character.position - position).normalized()
	velocity = direction * speed

func findPlayer():
	#Obtenemos el player a través del grupo (devuelve un array de coincidencias)
	character = get_tree().get_nodes_in_group("player")[0]

func tweenHit():
	
	var tween = get_tree().create_tween()
	# Cambiar color a rojo
	tween.tween_property(self, "modulate", Color.RED, 0.1)  # El tiempo 0.1 es más rápido para simular el golpe.

	# Regresar al color original
	tween.tween_property(self, "modulate", Color(1, 1, 1, 1), 0.3)  # Tiempo para volver al color original.
	
	tween.set_trans(Tween.TRANS_LINEAR)
	tween.set_ease(Tween.EASE_IN_OUT)

	
func tweenKnockback():
	var tween = get_tree().create_tween()
	# Cambiar color a rojo
	#cantidad de retroceso en el eje X
	var knockBack = position - Vector2(5,0)
	var originalPos = position
	tween.tween_property(self, "position", knockBack , 0.1)  # El tiempo 0.1 es más rápido para simular el golpe.

	# Regresar al color original
	tween.tween_property(self, "position", originalPos, 0.1)  # Tiempo para volver al color original.
	
	tween.set_trans(Tween.TRANS_LINEAR)
	tween.set_ease(Tween.EASE_IN_OUT)

func tweenDisapear():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "modulate", Color.TRANSPARENT, 0.5) 
	tween.set_trans(Tween.TRANS_LINEAR)
	#Esta propiedad del tween me permite hacer un callback al finalizar el tween. Interesante
	tween.tween_callback(death)
	
func death():
	queue_free()
