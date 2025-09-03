extends RigidBody3D

const speed=10
@onready var mesh=$MeshInstance3D
@onready var collision=$Area3D
var is_cleaner=true
var gravity=1.52
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if collision.has_overlapping_areas() or collision.has_overlapping_bodies():
		var caja=collision.get_overlapping_areas()
		print (caja)
		queue_free()
	pass


func _on_timer_timeout():
	queue_free()
	pass # Replace with function body.
