extends StaticBody3D
var mesh : MeshInstance3D
# Called when the node enters the scene tree for the first time.
func _ready():
	mesh = get_node("MeshInstance3D")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	mesh.mesh.material.uv1_offset.x += delta*3
	pass
