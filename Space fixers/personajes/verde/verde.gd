extends CharacterBody3D
# How fast the player moves in meters per second.
@export var speed = 5.0
# The downward acceleration when in the air, in meters per second squared.
@export var fall_acceleration = 6
@export var fuerza_salto=5
var color1=preload("res://Assets/materiales/new_standard_material_3d.tres")
var color2=preload("res://Assets/materiales/mira defecto.tres")
var color3=preload("res://Assets/materiales/objeto disponible.tres")
var target_velocity = Vector3.ZERO
var recogido=false
@onready var head=$head
@onready var camera=$head/Camera3D
@onready var inter=$head/Camera3D/interaccion
@onready var hand=$head/Camera3D/hand
@onready var mira=$head/Camera3D/laser
@onready var anim=$AnimationPlayer
@onready var efect=$efectos
@onready var reloj=$head/Camera3D/Control/time
@onready var cad=$cadencia
@onready var menu=$head/Camera3D/Control/menu

const sensitivity=0.005
var objeto_recogido
var index_col=-1
var fuerza=4
var idobj
var slowed=false
var can_lift_heavy=false
var bullet= load("res://objetos/character_objects/chemics.tscn")
var espera=false
var time=0
var debuff_vel=1
var peso_m=0


signal recogiendo
signal placa
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _unhandled_input(event):
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x*sensitivity)
		camera.rotate_x(-event.relative.y*sensitivity)
		camera.rotation.x=clamp(camera.rotation.x, deg_to_rad(-50), deg_to_rad(50))
		
	
func _physics_process(delta):
	var direction = Vector3.ZERO
	var input_dir=Input.get_vector("derecha","izquierda","atras","adelante")
	direction = (transform.basis*Vector3(input_dir.x,0,input_dir.y)).normalized()
	if Input.is_action_just_pressed("pausa"):
		menu.visible=not menu.visible
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().paused=not get_tree().paused
	
	if is_on_floor() and direction==Vector3.ZERO:
		anim.play("Idle")
		
	if is_on_floor() and Input.is_action_just_pressed("saltar"):
		anim.play("Jump")
		target_velocity.y=fuerza_salto
	
	if Input.is_action_just_pressed("levantar"):
		if objeto_recogido==null:
			recoger()
		elif objeto_recogido!=null:
			soltar()
			
	if Input.is_action_pressed("disparar") and espera==false:
		disparar()
		pass
	
	if inter.get_collider()!=null and inter.get_collider() is RigidBody3D and recogido==false:
		mira.set_surface_override_material(0,color3)
		
	elif recogido==false:
		mira.set_surface_override_material(0,color2)
			
	if not is_on_floor():
		target_velocity.y=target_velocity.y-(fall_acceleration*delta)
	# Ground Velocity
	target_velocity.x = direction.x * (speed/debuff_vel)
	target_velocity.z = direction.z * (speed/debuff_vel)

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
		debuff_vel-=peso_m
		peso_m=0
		index_col=-1
		mira.set_surface_override_material(0,color2)
		recogido=false

func disparar():
	var camerashot:=get_viewport().get_camera_3d()
	var camera_transform:=camerashot.global_transform
	var forward:= -camera_transform.basis.z
	var down:= camera_transform.basis.y
	print(forward, camera_transform)
	
	var projectile : RigidBody3D=bullet.instantiate()
	projectile.position=camera_transform.origin+forward*.5
	projectile.linear_velocity=forward*10
	var level:=get_parent()
	level.add_child(projectile)
	espera=true
	pass

func _on_grupo_de_cajas_levantado(pesor):
	debuff_vel+=pesor
	peso_m=pesor
	pass


func _on_timer_timeout():
	time+=1
	reloj.text="tiempo: %d:%02d" % [floor(time/60),int(time)%60]
	pass # Replace with function body.


func _on_efectos_efecto(efecto):
	print(speed)
	match efecto:
		"slow": 
			print(efecto)
			debuff_vel+=3

func _on_efectos_normal():
	debuff_vel-=3
	pass # Replace with function body.

func _on_cadencia_timeout():
	espera=false
	pass # Replace with function body.


func _on_exit_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_continue_pressed():
	menu.visible=not menu.visible
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	get_tree().paused=not get_tree().paused
	pass # Replace with function body.
