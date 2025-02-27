class_name BetterButton
extends Button


func _ready() -> void:
	connect_signals()


func connect_signals() -> void:
	self.focus_entered.connect(on_focus_entered)
	self.mouse_entered.connect(on_focus_entered)
	
	self.focus_exited.connect(on_focus_exited)
	self.mouse_exited.connect(on_focus_exited)
	
	self.button_down.connect(on_button_down)
	self.button_up.connect(on_button_up)
	
	self.pressed.connect(on_pressed)
	
	self.toggled.connect(on_toggled)


func on_focus_entered() -> void:
	pivot_offset = Vector2(size.x / 2, size.y / 2)
	var tween := self.create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BACK)
	tween.tween_property(self, "scale", Vector2(1.2, 1.2), 0.08)
	tween.tween_property(self, "scale", Vector2.ONE, 0.08)
	
	# TODO Play sound


func on_focus_exited() -> void:
	pass


func on_button_down() -> void:
	pass


func on_button_up() -> void:
	pass


func on_pressed() -> void:
	pivot_offset = Vector2(size.x / 2, size.y / 2)
	var tween := self.create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BACK)
	tween.tween_property(self, "scale", Vector2(1.2, 1.2), 0.08)
	tween.tween_property(self, "scale", Vector2.ONE, 0.08)
	
	# TODO Play sound


func on_toggled(toggled_on: bool) -> void:
	pass
