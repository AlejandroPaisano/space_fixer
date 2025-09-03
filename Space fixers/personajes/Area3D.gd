extends Area3D

var detectado=false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if get_overlapping_areas().is_empty()==false:
		if Input.is_action_just_pressed("interactuar"):
			var pc=self.get_overlapping_areas()[0]
			print(pc)
			
			print(pc.get_parent().get_name())
			pc.get_parent().activar()
		pass
