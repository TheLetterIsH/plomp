class_name BetterLabel
extends RichTextLabel

signal text_updated


func _ready() -> void:
	connect_signals()


func connect_signals() -> void:
	self.text_updated.connect(on_text_updated)


func update_text(new_text: String) -> void:
	text = new_text
	text_updated.emit()


func on_text_updated() -> void:
	var tween := self.create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BACK)
	tween.tween_property(self, "scale", Vector2(1.2, 1.2), 0.08)
	tween.tween_property(self, "scale", Vector2.ONE, 0.08)
