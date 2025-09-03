extends Label3D

@onready var labels=get_tree().get_nodes_in_group("Label_cult")
@onready var labelact=labels[2]
signal failednumb
func _on_tablero_ver_2_number(numero):
	if numero.length()>5:
		numero=numero.right(1)
	else:
		numero=1
	text=str(numero)
	pass # Replace with function body.



func _on_boton_g_botonazo(name):
	if labelact.text==text:
		print("papotas")
	else:
		labelact.text="fff"
	pass # Replace with function body.
