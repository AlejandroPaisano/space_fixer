extends Node3D
@onready var manchas=get_tree().get_nodes_in_group("mancha")

# Called when the node enters the scene tree for the first time.
func _ready():
	print(manchas)
	for manchat in manchas:
		var indice = manchat.get_index()
		print(manchat.get_name())
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_mancha_area_entered(area):
	pass # Replace with function body.
