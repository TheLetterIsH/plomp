class_name Game
extends Node


func _enter_tree() -> void:
	initialize()


func _ready() -> void:
	pass


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton or event is InputEventMouseMotion:
		Globals.current_input_device = Globals.InputDevice.KEYBOARD_AND_MOUSE
	elif event is InputEventJoypadButton or event is InputEventJoypadMotion:
		Globals.current_input_device = Globals.InputDevice.CONTROLLER


func initialize() -> void:
	# Set reference to self in Globals
	Globals.game = self
	
	# Load options
	Globals.options_file_path = OS.get_user_data_dir() + "/" + Globals.options_file_name
	
	if FileAccess.file_exists(Globals.options_file_path):
		Globals.options_file.load(Globals.options_file_path)
		
		for section in Globals.options_file.get_sections():
			for key in Globals.options_file.get_section_keys(section):
				Globals.options[section][key] = Globals.options_file.get_value(section, key)
		
		return
	
	for section in Globals.options.keys():
		for key in Globals.options[section].keys():
			Globals.options_file.set_value(section, key, Globals.options[section][key])
	
	Globals.options_file.save(Globals.options_file_path)


func save_option(section: String, key: String, value: Variant) -> void:
	Globals.options[section][key] = value
	
	Globals.options_file.set_value(section, key, value)
	Globals.options_file.save(Globals.options_file_path)
	
	apply_option(key, value)


func apply_option(key: String, value: Variant) -> void:
	match key:
		"fullscreen":
			if value:
				DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
				DisplayServer.window_set_size(DisplayServer.screen_get_size())
			else:
				DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
				DisplayServer.window_set_size(Vector2i(1280, 720))
				get_window().move_to_center()
		"vsync":
			if value:
				DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
			else:
				DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
		"music":
			# TODO Set music volume using the sound manager
			pass
		"sound":
			# TODO Set sound and UI sound volumes using the sound manager
			pass


func apply_options() -> void:
	for section in Globals.options.keys():
		for key in Globals.options.get(section).keys():
			apply_option(key, Globals.options[section][key])
