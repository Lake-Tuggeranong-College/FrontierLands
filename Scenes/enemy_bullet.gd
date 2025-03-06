extends Area3D

@export var speed: float = 1.0
@export var bullet_scene = "res://Scenes/bullet.tscn"

#func _ready(delta):
	# Apply an initial velocity in the forward direction
#	linear_velocity = transform.basis.z * -speed
#	global_transform.origin -= transform.basis.z.normalized() * speed * delta

func _process (delta):
	# move the bullet forwards
	global_transform.origin -= transform.basis.z.normalized() * speed * delta
#func _on_collision():
	# Handle what happens when the bullet collides (e.g., damage player, destroy bullet)
	#queue_free()  # Destroy the bullet after collision


func _on_body_entered(body):
	print("collide")
	if body.has_method("receive_damage"):
		body.receive_damage()
	queue_free()
	
