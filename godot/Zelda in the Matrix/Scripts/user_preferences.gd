class_name UserPreferences extends Resource	

@export_range(0, 1, .05) var master_audio_level: float = 1.0
@export var action_events: Dictionary = {}



func save() -> void:
	ResourceSaver.save(self, "D://user_prefs.tres")
	

static func load_or_create() -> UserPreferences:
	var res: UserPreferences = load("D://user_prefs.tres") as UserPreferences
	if !res:
		res = UserPreferences.new()
	return res
