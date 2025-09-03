extends Node3D
@onready var caja_2 = $Caja2
signal levantado
@onready var caja=get_tree().get_nodes_in_group("cajas")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func printcajas(grupo,index_col):
	for cajat in grupo:
		var indice=cajat.get_index()
		print(indice)
		
		if indice==index_col:
			emit_signal("levantado",cajat.pesor)
			break
	pass


func _on_character_body_3d_recogiendo(index_col):
	printcajas(caja,index_col)
	pass # Replace with function body.


func _on_astronaut_rae_the_red_panda_recogiendo(index_col):
	printcajas(caja,index_col)
	pass # Replace with function body.


func _on_astronaut_barbara_the_bee_recogiendo(index_col):
	printcajas(caja,index_col)
	pass # Replace with function body.




func _on_astronaut_finn_the_frog_recogiendo(index_col):
	printcajas(caja,index_col)
	pass # Replace with function body.
