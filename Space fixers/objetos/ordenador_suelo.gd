extends StaticBody3D

@onready var estado=false
signal acticvado
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_area_3d_area_entered(_area):
	print("papas")
	pass # Replace with function body.

func activar():
	if estado==true:
		estado=false
		emit_signal("acticvado",estado,name)
		return
		
	if estado==false:
		estado=true
		emit_signal("acticvado",estado,name)
		return
		
