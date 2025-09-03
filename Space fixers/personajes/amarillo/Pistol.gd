extends BoneAttachment3D

@onready var inter=$"../../../head/Camera3D/interaccion"
@onready var aparent=$"../../.."
var bullet= load("res://objetos/character_objects/bullet.tscn")
var espera=false
func _physics_process(_delta):
	if Input.is_action_pressed("disparar") and espera==false:
		disparar()

func disparar():
	var newbullet=bullet.instantiate()
	newbullet.position=inter.global_position
	var vec=inter.global_transform.basis
	newbullet.transform.basis=vec
	aparent.get_parent().add_child(newbullet)
	espera=true


func _on_cadencia_timeout():
	espera=false
	pass # Replace with function body.
