extends Node

@onready var main_menu=$CanvasLayer/PanelContainer
# Called when the node enters the scene tree for the first time.
var player= preload("res://personajes/rojo 2.tscn")
const port = 9999
var enet_peer= ENetMultiplayerPeer.new()
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_salir_b_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_join_b_pressed():
	main_menu.hide()
	enet_peer.create_client("localhost",port)
	
	multiplayer.multiplayer_peer=enet_peer
	pass # Replace with function body.


func _on_host_b_pressed():
	main_menu.hide()
	enet_peer.create_server(port)
	
	multiplayer.multiplayer_peer=enet_peer
	multiplayer.peer_connected.connect(add_player)
	add_player(multiplayer.get_unique_id())
	
	pass # Replace with function body.
	
func add_player(peer_id):
	var players=player.instantiate()
	players.name=str(peer_id)
	add_child(players)
