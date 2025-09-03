extends Area3D

@onready var control=$"."
@onready var grupo_placas=get_tree().get_nodes_in_group("placa")
var placa_presionada
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass



func _on_astronaut_rae_the_red_panda_placa():
	print(control.get_overlapping_areas())
	for placat in grupo_placas:
		print(placat.get_instance_id())
	pass # Replace with function body.
