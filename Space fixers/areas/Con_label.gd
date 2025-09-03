extends Node3D
@onready var labels=get_tree().get_nodes_in_group("Label_cult")
var seleccion
signal numero_sec
#lista a duplicar
var num_list=["1","2","3","4","5","6","7","8","9"]
#duplicado para conservar datos
var num_list_dupl
func _ready():
	#creamos una nueva semilla para este metodo
	randomize()
	#duplicamos la lista de elementos a elegir
	num_list_dupl=num_list.duplicate()
	#mezclamos la lista
	num_list.shuffle()
	pass

func _process(_delta):
	pass
	
func cambior(nombre):
	for x in labels.size():
		seleccion=labels[x]
		#Comparamos la ultima letra, dado que usamos esa como referencia para los objetos
		if seleccion.name.right(1)==nombre.right(1):
			seleccion.text=seleccion_random()
	pass
	
#randomizador para tomar numeros
func seleccion_random():
	if num_list.is_empty():
		num_list=num_list_dupl.duplicate()
		num_list.shuffle()
	
	var numero=num_list.pop_front()
	return numero


func _on_boton_n_botonazo(nombre):
	cambior(nombre)
	pass # Replace with function body. 
	
func _on_boton_c_botonazo(nombre):
	#Buscamos la etiqueta adecuada
	cambior(nombre)
	pass # Replace with function body.

func _on_boton_p_botonazo(nombre):
	cambior(nombre)
	pass # Replace with function body.
