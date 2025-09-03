extends Area3D

var id
signal presionado
@onready var pres=false
@onready var placa=$"."
# Called when the node enters the scene tree for the first time.
func _ready():
	id=get_index()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_area_entered(area):
	print(get_index())
	
	pass # Replace with function body.
