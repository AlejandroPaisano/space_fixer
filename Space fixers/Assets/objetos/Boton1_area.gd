extends MeshInstance3D
signal animacion
signal codigo
@onready var anim=$"../AnimationPlayer"
var numero=""
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

func activar():
	if name.length()>5:
		numero=name.right(1)
	numero="presionar"+numero
	print(numero)
	anim.play(numero)
	numero=""
	emit_signal("codigo",numero)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
