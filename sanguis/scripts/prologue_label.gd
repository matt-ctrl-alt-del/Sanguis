extends Label

func _ready() -> void:
	var full_text = "Welcome Sanguis,
	You are a vampire stuck underground, try to make your way up and out.
	To do this, collect items, and the wicked doors will open automatically.
	Who knows what else awaits?
	
	Controls:
	A - Move to the left.
	D - Move to the right
	Spacebar - Jump
	
	This game can be played with a controller.
	Enjoy."
	
	text = full_text
	visible_ratio = 0.0
	
	var tween = create_tween()
	tween.tween_property(self, "visible_ratio", 1.0, 8.0)
