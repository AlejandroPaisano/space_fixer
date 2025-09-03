extends Node3D
@onready var anim=$"../AnimationPlayer"

@onready var grupo=get_tree().get_nodes_in_group("teclado_plantas")
signal numero
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
func activar():
	var actual=grupo[0]
	for i in grupo.size():
		actual=grupo[i]
		if actual.has_overlapping_areas()==true:
			var animar="presionar"
			var number=actual.name
			if number.length()>5:
				animar=animar+number.right(1)
			anim.queue(animar)
			emit_signal("numero",number)
			break
		pass
	pass
