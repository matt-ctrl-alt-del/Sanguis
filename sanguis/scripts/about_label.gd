extends Label

func show_about_text():
	var full_text = "Sanguis is a platformer game made by matt_not_found.
	This game is for Hack Club Terra! Made with love & coffee - Matt
	
	Context: I wanted to go back to basics, so I made a platformer!
	I wanted to learn how to polish games and add 'game juice.'
	I am proud of my work and this is only the beginning.
	
	Controls:
		A - Move to the left
		D - Move to the right
		Spacebar - Jump"
	
	text = full_text
	visible_ratio = 0.0
	
	var tween = create_tween()
	tween.tween_property(self, "visible_ratio", 1.0, 6.0)
