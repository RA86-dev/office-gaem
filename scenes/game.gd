extends Node2D

func _ready() -> void:
	$Email_window.hide()
func _process(delta: float) -> void:
	pass
func _on_button_pressed() -> void:
	pass # Replace with function body.


func _on_logo_button_pressed() -> void:  # open_window
	$Email_window.show()
