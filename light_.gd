extends RigidBody3D
@export var speed : float = -4
var l_time : int
# Called when the node enters the scene tree for the first time.
func _ready():
	l_time = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	l_time += 1
	var collision := move_and_collide(Vector3(speed,0,0) * delta)
	if(l_time > 250):
		queue_free()
