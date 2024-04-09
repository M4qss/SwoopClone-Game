extends RigidBody3D
var plane : Node3D
@export var speed : float = -4
@export var vertspeed : float = 0
var menu : PackedScene

func _ready():
	vertspeed = RandomNumberGenerator.new().randf_range(-0.3, 0.3)
	plane = get_node("../Plane")
	menu = preload("res://Menu.tscn")

func _process(delta):
	var collision := move_and_collide(Vector3(speed,vertspeed,0) * delta)
	if collision != null:
		SlScr.save_game(int(plane.score))
		get_tree().change_scene_to_file("res://Menu.tscn")
