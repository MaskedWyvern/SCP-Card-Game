extends Node

var player_file_path = "user://player_data.json"

var default_data = {
	"player_health" : 100,
	"player_name" : "Qumble"
}

var current_data = {}

func reset_data():
	current_data.clear()
	current_data = default_data.duplicate(true)
	
func save_data(path : String):
	var file
	
	file = File.new()
	file.open(path, File.WRITE)
	file.store_line(to_string(current_data))
	file.close()
	
func load_data(path : String):
#	var file = File.new()
	#file.open(path, File.READ)
	#
	#var data_json = JSON.parse(file.get_as_text())
	
	#file.closed
	
	#current_data = data_json.result
	pass
