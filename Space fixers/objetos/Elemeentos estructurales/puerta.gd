extends StaticBody3D

@onready var anim=$AnimationPlayer
@onready var door=$CollisionShape3D
@onready var time=$Tiempo

var tiempo=false
var estado=false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func _conexion():
	print("tiempo ",tiempo)
	if estado==true and tiempo==false:
		estado=false
		anim.play("cerrar")
		door.disabled=false
		tiempo=true
		time.start()
		return
		
	if estado==false and tiempo==false:
		estado=true
		anim.play("Apertura")
		door.disabled=true
		tiempo=true
		time.start()
		return
		


func _on_tiempo_timeout():
	if tiempo==true:
		tiempo=false
		return
	pass # Replace with function body.


func _on_boton_p_cerrado():
	if door.disabled==true:
		anim.play("cerrar")
	door.disabled=false
	tiempo=true
	time.start()
