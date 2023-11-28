extends Reference

var config : ConfigFile = ConfigFile.new()

func save(filename: String) -> void:
	var file : File = File.new()
	file.open(filename, File.WRITE)
	config.save(file)
	file.close()

func load(filename: String) -> void:
	var file : File = File.new()
	if file.open(filename, File.READ) == OK:
		config.load(file)
		file.close()
	
# Save data
var save_data : SaveData = SaveData.new()
save_data.config.set_value("Videos", "Fullscreen", true)
save_data.config.set_value("Audio", "MasterVolume", 0.8)
save_data.save("user://save_data.cfg")

# Load data
var loaded_data : SaveData = SaveData.new()
loaded_data.load("user://save_data.cfg")

# Access loaded values
var fullscreen : bool = loaded_data.config.get_value("General", "Fullscreen", false)
var master_volume : float = loaded_data.config.get_value("Audio", "MasterVolume", 1.0)
