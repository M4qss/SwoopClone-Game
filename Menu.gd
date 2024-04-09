extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = "RECORD:" + str(SlScr.score)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_exit_button_down():
	get_tree().quit()


func _on_button_play_button_down():
	get_tree().change_scene_to_file("res://models/main_scene.tscn")


