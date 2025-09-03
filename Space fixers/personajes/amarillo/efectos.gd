extends Area3D

var efectos=get_overlapping_areas()
signal efecto
signal normal
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if get_overlapping_areas().size()==0:
		pass
	pass



func _on_area_entered(_area):
	efectos=get_overlapping_areas()
	var primero=efectos[0]
	emit_signal("efecto",primero.get_effects())
	
	pass # Replace with function body.

func _on_area_exited(_area):
	print("papa")
	emit_signal("normal")
	pass # Replace with function body.
