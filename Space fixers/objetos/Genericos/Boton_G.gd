extends Node3D

signal botonazo
signal cerrado
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func activar():
	emit_signal("botonazo",name)
	emit_signal("cerrado")
