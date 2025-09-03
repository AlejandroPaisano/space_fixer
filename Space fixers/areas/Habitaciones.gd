extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	var test=self.find_child("Pared_iz")
	var pared=test.find_child("MeshInstance3D")
	var mesh=pared.get_mesh()
	print()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
