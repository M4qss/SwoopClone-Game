extends RigidBody3D

var moveVar : float
@export var spanTime : int
var timer : int
var coin : PackedScene
var fuel : PackedScene
var barrier : PackedScene
var spawner

# Called when the node enters the scene tree for the first time.
func _ready():
	moveVar = 0
	spawner = get_node(".") as RigidBody3D
	coin = preload("res://coin.tscn")
	fuel = preload("res://fuelToken.tscn")
	barrier = preload("res://barrier.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	spawner.position.y = 1.5 + sin(moveVar)
	moveVar += 0.01
	timer += 1
	if(timer > spanTime):
		spawn()
		timer = 0
	
#coin spawn
func spawn():
	var spawn_instance
	var speedlock : bool = false
	var rnd = RandomNumberGenerator.new().randf_range(0,1)
	if( rnd < 0.15):
		spawn_instance = fuel.instantiate()
	elif(rnd > 0.60):
		spawn_instance = barrier.instantiate()
		speedlock = true
	else:
		spawn_instance = coin.instantiate()
	get_parent().add_child(spawn_instance)
	spawn_instance.position = position
	if(!speedlock):
		spawn_instance.speed = RandomNumberGenerator.new().randf_range(-2.5, -1.5)
