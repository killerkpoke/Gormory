extends Node

# Later using 'user' as path
const file_name = "res://env.dat"
var sdata

func _ready():
	sdata = ini()
	load_env()
	
func ini():
	# Storing .env var and later other things..
	var dict = {
		"env" : "dev",
	}
	return dict
	
func save_env(content):
	var file = File.new()
	var error = file.open(file_name, File.WRITE)
	if error == OK:
		print("Saving...")
		file.store_line(to_json(content))
		file.close()
	else:
		print("Saving FAILED!")
	
func load_env():
	var file = File.new()
	if not file.file_exists(file_name):
		save_env(sdata)
		print("save start")
		
	else:
		file.open(file_name, File.READ)
		var data = file.get_line()
		print(data)
		file.close()
