extends CharacterBody3D
# How fast the player moves in meters per second.
@export var speed = 8
# The downward acceleration when in the air, in meters per second squared.
@export var fall_acceleration = 6
@export var fuerza_salto=5
var color1=preload("res://Assets/materiales/new_standard_material_3d.tres")
var color2=preload("res://Assets/materiales/mira defecto.tres")
var color3=preload("res://Assets/materiales/objeto disponible.tres")
var target_velocity = Vector3.ZERO
var recogido=false
@onready var camera=$head/Camera3D
@onready var player=$"Pivote/player-red"
@onready var inter=$head/Camera3D/interaccion
@onready var hand=$head/Camera3D/hand
@onready var mira=$head/Camera3D/laser
@onready var anim=$"Pivote/player-red"


const sensitivity=0.005
var objeto_recogido
var index_col=-1
var fuerza=4
var idobj
var slowed=false
signal recogiendo
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _unhandled_input(event):
	if event is InputEventMouseMotion:
		camera.rotate_x(-event.relative.y*sensitivity)
		rotate_y(-event.relative.x*sensitivity)
		camera.rotation.x=clamp(camera.rotation.x, deg_to_rad(-50), deg_to_rad(50))
		
	
func _physics_process(delta):
	var direction = Vector3.ZERO
	var input_dir=Input.get_vector("derecha","izquierda","atras","adelante")
	direction = (transform.basis*Vector3(input_dir.x,0,input_dir.y)).normalized()
	if Input.is_action_just_pressed("pausa"):
		get_tree().quit()
		
	if is_on_floor() and Input.is_action_just_pressed("saltar"):
		target_velocity.y=fuerza_salto
		
	if Input.is_action_just_pressed("levantar"):
		if objeto_recogido==null:
			recoger()
		elif objeto_recogido!=null:
			soltar()
			
	if inter.get_collider()!=null and inter.get_collider() is RigidBody3D and recogido==false:
		mira.set_surface_override_material(0,color3)
	elif recogido==false:
		mira.set_surface_override_material(0,color2)
			
	if not is_on_floor():
		target_velocity.y=target_velocity.y-(fall_acceleration*delta)
	# Ground Velocity
	target_velocity.x = direction.x * speed
	target_velocity.z = direction.z * speed

	if objeto_recogido!=null:
		var a = objeto_recogido.global_transform.origin
		var b = hand.global_transform.origin
		objeto_recogido.set_linear_velocity((b-a) * fuerza)
	# Vertical Velocity
	if not is_on_floor(): # If in the air, fall towards the floor. Literally gravity
		target_velocity.y = target_velocity.y - (fall_acceleration * delta)
	
	
	# Moving the Character
	velocity = target_velocity
	move_and_slide()

func recoger():
	var colision=inter.get_collider()
	if colision != null and colision is RigidBody3D:
		mira.set_surface_override_material(0,color1)
		recogido=true
		objeto_recogido=colision
		index_col=colision.get_index()
		emit_signal ("recogiendo",index_col)
		
		
func soltar():
	if objeto_recogido!=null:
		objeto_recogido=null
		speed=8
		index_col=-1
		mira.set_surface_override_material(0,color2)
		recogido=false

func _on_grupo_de_cajas_levantado(pesor):
	print ("holi")
	print(pesor)
	speed=speed/pesor

func efec_piso():
	pass


func _on_placa_area_entered(area):
	print ("presionando placa")
	pass # Replace with function body.
