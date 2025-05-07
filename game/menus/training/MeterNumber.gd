extends Label

func update_text(value):
	self.text = str(value)

func _on_SuperMeter_value_changed(value):
	update_text(value)

func _on_SyncRate_value_changed(value):
	update_text(value)

func _on_AssistMeter_value_changed(value):
	update_text(value)
