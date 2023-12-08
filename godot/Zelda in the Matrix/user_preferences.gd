class_name UserPreferencesextends extends Resource

@export var action_events: Dictionary = {
	"volumen":AudioServer.set_bus_volume_db,
	"windows_set_mode":DisplayServer.window_set_mode,
}

func save() -> void:
	ResourceSaver.save(self, "user://user_prefs.tres")
	

static func load_or_create() -> UserPreferences:
	var res: UserPreferences = load("user://user_prefs.tres") as UserPreferences
	if !res:
		res = UserPreferences.new()
	return res
