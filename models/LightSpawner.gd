extends Node3D
@export var spanTime : int
var timer : int
var light : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	light = preload("res://light_.tscn")
	timer = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer += 1
	if(timer > spanTime):
		spawn()
		timer = 0
func spawn():
	var spawn_instance : RigidBody3D
	spawn_instance = light.instantiate()
	spawn_instance.rotation = Vector3(0, 90, 0) 
	spawn_instance.position = position
	get_parent().add_child(spawn_instance)
