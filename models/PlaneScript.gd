extends RigidBody3D
var plane
var score
var fuel
var scoreLabel
var fuelLabel
var particles
var maxFuel

func _ready():
	plane = get_node(".") as RigidBody3D
	scoreLabel = get_node("../ScoreLabel") as Label
	fuelLabel = get_node("../FuelLabel") as Label
	fuel = fuelLabel.text.length() as int
	maxFuel = fuel
	score = 0
	
	#particles enabling
	particles = get_node("CPUParticles3D") as CPUParticles3D
	particles.emitting = true
	
func _process(delta):
	var velY = plane.linear_velocity.y
	var angZ = plane.angular_velocity.z
	
	#score update
	score = str(int(score) + 1)
	scoreLabel.text = "Score:" + score
	
	#fuel update
	if(fuel != fuelLabel.text.length() as int):
		fuelLabel.text = ""
		for i in fuel:
			fuelLabel.text += "|"
	if(fuel == 0):
		remove_child(particles)
func _input(event):
	if(Input.is_action_just_pressed("power_up") && fuel > 0):
		plane.apply_impulse(Vector3(0,1.5,0))
		fuel -= 1
		particles.amount = 25
		await get_tree().create_timer(1.5).timeout
		particles.amount = 5

