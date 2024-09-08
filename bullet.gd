extends CharacterBody2D


var dir: Vector2 = Vector2.ZERO
const SPEED = 300.0



func _physics_process(delta: float) -> void:
	# Add the gravity.
	velocity = dir.normalized() * SPEED

	move_and_slide()


func _on_timer_timeout() -> void:
	queue_free()
	


func _on_bullet_hit_area_entered(area: Area2D) -> void:
	if area.name == "enemyHitbox":
		
		queue_free()
		



	
