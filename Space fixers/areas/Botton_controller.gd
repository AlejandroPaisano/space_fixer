extends Node3D

@onready var grupo=get_tree().get_nodes_in_group("Pantalla")
@onready var textura=preload("res://Assets/materiales/banana.jpg")
@onready var textura2=preload("res://Assets/materiales/sandia.png")
@onready var textura3=preload("res://Assets/materiales/maiz.png")
@onready var textura4=preload("res://Assets/materiales/frijol.png")
@onready var textura5=preload("res://Assets/materiales/trigo.jpg")

@onready var texturan=preload("res://Assets/materiales/Nutrientes/Fosforo.png")
@onready var texturan2=preload("res://Assets/materiales/Nutrientes/potasio.png")
@onready var texturan3=preload("res://Assets/materiales/Nutrientes/Hueso.png")
@onready var texturan4=preload("res://Assets/materiales/Nutrientes/Nitrogeno.JPG")
@onready var texturan5=preload("res://Assets/materiales/Nutrientes/Magnesio.png")

@onready var texturaS=preload("res://Assets/materiales/Nutrientes/Sustrato/arcilla.jpg")
@onready var texturaS2=preload("res://Assets/materiales/Nutrientes/Sustrato/agua.png")
@onready var texturaS3=preload("res://Assets/materiales/Nutrientes/Sustrato/arena.jpg")
@onready var texturaS4=preload("res://Assets/materiales/Nutrientes/Sustrato/tierra.jpg")
@onready var texturaS5=preload("res://Assets/materiales/Nutrientes/Sustrato/wood.jpg")
var num_list=[1,2,3,4,5]
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
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func seleccion_random():
	if num_list.is_empty():
		num_list=num_list_dupl.duplicate()
		num_list.shuffle()
	
	var numero=num_list.pop_front()
	return numero
	
func _on_boton_p_botonazo(nombre):
	busqueda(nombre)
	print("cositas")
	pass # Replace with function body.


func _on_boton_c_botonazo(nombre):
	busqueda(nombre)
	print("cositas")
	pass # Replace with function body.


func _on_boton_n_botonazo(nombre):
	busqueda(nombre)
	print("cositas")
	pass # Replace with function body.
	
func busqueda(nombre):
	var random=seleccion_random()
	print(random)
	for cont in grupo.size():
		
		var pantallatemp= grupo[cont]
		if pantallatemp.name.ends_with(nombre.right(1)):
			match nombre.right(1):
				"C":
					match random:
						1:
							pantallatemp.activar(textura)
						2:
							pantallatemp.activar(textura2)
						3:
							pantallatemp.activar(textura3)
						4:
							pantallatemp.activar(textura4)
						5:
							pantallatemp.activar(textura5)
				"N":
					match random:
						1:
							pantallatemp.activar(texturan)
						2:
							pantallatemp.activar(texturan2)
						3:
							pantallatemp.activar(texturan3)
						4:
							pantallatemp.activar(texturan4)
						5:
							pantallatemp.activar(texturan5)
				"P":
					match random:
						1:
							pantallatemp.activar(texturaS)
						2:
							pantallatemp.activar(texturaS2)
						3:
							pantallatemp.activar(texturaS3)
						4:
							pantallatemp.activar(texturaS4)
						5:
							pantallatemp.activar(texturaS5)
			print(pantallatemp)
			
			return
			
	pass
