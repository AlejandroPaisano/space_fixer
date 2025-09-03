extends Area3D
@onready var colision=$CollisionShape3D
@onready var cuboc=$".."
var cleanable=true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func _on_area_entered(area):
	print("limpio")
	cuboc.queue_free()
	pass # Replace with function body.
