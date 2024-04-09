extends StaticBody3D
var mesh : MeshInstance3D
var plane : Node3D
var sinOffset
var menu : PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	sinOffset = 0
	mesh = get_node("MeshInstance3D")
	plane = get_node("../Plane")
	menu = preload("res://Menu.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	mesh.mesh.material.uv1_offset.x += delta
	var collision := move_and_collide(Vector3(0,sin(sinOffset*5)/7,0) * delta)
	sinOffset += 10*delta
	if collision != null:
		var body = collision.get_collider()
		if body.name == "Plane":
			SlScr.save_game(int(plane.score))
			get_tree().change_scene_to_file("res://Menu.tscn")
