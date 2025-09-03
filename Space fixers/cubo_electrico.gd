extends StaticBody3D

var energia=false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_deteccion_elec_area_entered(area):
	if energia==false:
		energia=true
	else:
		energia=false
	print("energia en estado:",energia)
	pass # Replace with function body.
