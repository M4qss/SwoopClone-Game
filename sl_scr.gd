extends Node

var config
var path_to_config := "user://FPF.cfg"
var section_name := "global"

var score : int = 0

func _ready():
	load_game()
	print("Автозагрузка выполнена")

func save_game(scr : int) -> void:
	if(score < scr):
		config.set_value(section_name, "max_score", scr)
		score = scr
		config.save(path_to_config)
		print("Очки сохранены")
	else:
		print("Очки не изменены")
	
func load_game() -> void:
	config = ConfigFile.new()
	config.load(path_to_config)
	score = config.get_value(section_name, "max_score", 0)
	print("Очки загружены")
