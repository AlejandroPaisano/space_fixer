extends Node3D

@onready var grupo=get_tree().get_nodes_in_group("Puertas")
@onready var reloj=$"../Puerta_time"
var tiempo=false
signal puerta_actuar
# Called when the node enters the scene tree for the first time.
func _ready():
	
	print (grupo[0].name)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_ordenador_acticvado(_estado,nombre):
	_busqueda(nombre)
	pass # Replace with function body.


func _on_ordenador_2_acticvado(_estado,nombre):
	_busqueda(nombre)
	pass # Replace with function body.


func _on_ordenador_3_acticvado(_estado,nombre):
	_busqueda(nombre)
	pass # Replace with function body.

func _busqueda(nombre):
	for cont in grupo.size():
		print(cont)
		var namesel=grupo[cont].name
		if namesel.ends_with(nombre.right(1)):
			grupo[cont]._conexion()
			
	


func _on_puerta_time_timeout():
	print("reloj")
	pass # Replace with function body.
