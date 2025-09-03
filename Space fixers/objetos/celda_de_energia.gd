extends RigidBody3D
var mat1=preload("res://Assets/Nave exterior.tres")

# Called when the node enters the scene tree for the first time.
func _ready():
	var meshloc=$mesh_celda
	meshloc.set_surface_override_material(0,mat1)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
