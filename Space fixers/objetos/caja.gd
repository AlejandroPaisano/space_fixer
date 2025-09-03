extends "res://objetos/test_box.gd"


# Called when the node enters the scene tree for the first time.
func _ready():
	pesor=4
	print(get_index())
	get_node("CollisionShape3D").set_scale(Vector3(1.5,1.5,1.5))
	get_node("MeshInstance3D").set_scale(Vector3(1.5,1.5,1.5))


# Called every frame. 'delta' is the elapsed time since the previous frame.
