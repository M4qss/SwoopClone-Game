extends RigidBody3D

var plane : Node3D
@export var speed : float = -2

var sinOffset : float
func _ready():
	sinOffset = 0
	plane = get_node("../Plane")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var collision := move_and_collide(Vector3(speed,sin(sinOffset)/10,0) * delta)
	sinOffset += 10*delta
	if collision != null:
		var body = collision.get_collider()
		if body.name == "Plane":
			plane.fuel += 20
			if(plane.fuel > plane.maxFuel):
				plane.fuel = plane.maxFuel
			queue_free()
