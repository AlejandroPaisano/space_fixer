extends Node3D

var slow=true
var cleanable=true
signal efecto
signal efecton
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func get_effects():
	return "slow"


func _on_area_entered(area):
	print("Desecho")
	queue_free()
	pass # Replace with function body.
