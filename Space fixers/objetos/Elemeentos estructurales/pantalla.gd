extends MeshInstance3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func activar(skin):
	get_mesh().get_material().set_texture(StandardMaterial3D.TEXTURE_ALBEDO,skin)
