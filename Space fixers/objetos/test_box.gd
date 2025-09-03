extends RigidBody3D

var pesor=3
signal recogido
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _print_name():
	print(self.name)
	
func _levantar():
	print("papa")
	emit_signal("recogido",pesor)
