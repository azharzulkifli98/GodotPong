extends Control


# Declare member variables here. Examples:
#onready var multiplayer_config_ui = $Multiplayer_configure
onready var server_ip_address = $Server_ip_address
#onready var device_ip_address = $CanvasLayer/Device_ip_address


# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().connect("network_peer_connected", self, "_player_connected")
	get_tree().connect("network_peer_disconnected", self, "_player_disconnected")
	get_tree().connect("connected_to_server", self, "_connected_to_server")
	
	#device_ip_address.text = Network.ip_address


func _player_connected(id) -> void:
	print("Player " + str(id) + " has connected")

func _player_disconnected(id) -> void:
	print("Player " + str(id) + " has disconnected")


func _on_Create_server_pressed():
	Network.create_server()
	server_ip_address.text = Network.ip_address


func _on_Join_server_pressed():
	Network.join_server()
	server_ip_address.text = "Network found!"
