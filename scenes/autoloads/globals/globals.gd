extends Node

# Game
var game: Game

# Input
enum InputDevice {
	KEYBOARD_AND_MOUSE,
	CONTROLLER,
}

var current_input_device: InputDevice = InputDevice.KEYBOARD_AND_MOUSE

# Settings
var options_file: ConfigFile = ConfigFile.new()
var options_file_name: String = "options.pp"
var options_file_path: String

var options := {
	video = {
		fullscreen = true,
		vsync = true,
	},
	audio = {
		music = 0.5,
		sound = 0.5,
	}
}
