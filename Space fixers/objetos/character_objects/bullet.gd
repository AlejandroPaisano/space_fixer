extends Node3D

const speed=10
@onready var mesh=$MeshInstance3D
@onready var collision=$RayCast3D
var is_cleaner=true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position+=transform.basis*Vector3(0,0,-speed)*delta
	if collision.is_colliding():
		var caja=collision.get_collider()
		print (caja)
		queue_free()
	pass


func _on_timer_timeout():
	queue_free()
	pass # Replace with function body.
