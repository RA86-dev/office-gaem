extends Node2D



func _ready() -> void:
	pass 

func _input(event):
	var content = event.as_text()
	var character_safe = ""
	
	if event is not InputEventKey:
		return 
	#pri
	if content and event.is_pressed() and TheGlobe.typingEnabled == true and not content.begins_with("Mouse"):
		if content == "Enter":
			$Email_text.text += "\n"
			character_safe = "\n"
		elif not content.length() > 1:
			$Email_text.text += event.as_text()
			character_safe = event.as_text()
			$Hit.play()
		elif content == "Backspace":
			$Email_text.text.left(-1)
			character_safe = ""
		elif content.length() > 1:
			pass
		else:
			print("NADA!")
		print("Typing Enabled: " + str(TheGlobe.typingEnabled))
	
	
	
	
	#print(TheGlobe.keys_reeeee, "keyyysss value")
	var actual_list: Array = [
		
	]
	for item in TheGlobe.keys_reeeee:
		if item: 
			actual_list.append(item.animation)
		else:
			actual_list.append(null)
	if character_safe in actual_list: # character_safe = string, keys_reeeee = list[Node]
		for i in range(TheGlobe.keys_reeeee.size() -1, -1, -1): 
			if not TheGlobe.keys_reeeee[i]:
				pass
			else: 
				var character = TheGlobe.keys_reeeee[i] # HOPEFULLY string - but gives an error?
				print("Character Safe: " + character_safe + "\n Animation: " + character.animation)
				if character_safe == character.animation: # character_safe (string) == Character (Node)
					print(i) # "int number" 
					var here = TheGlobe.keys_reeeee.pop_at(i) # checked the logs; here needs to be Node; because 'free_queue' and 'self-modulation' are tags for node only
					here.self_modulate = Color(0.0, 0.494, 0.0, 1.0)
					TheGlobe.points += 1
					print("+1")
					TheGlobe.keys_reeeee.pop_at(i)
					here.free()
					
					TheGlobe.points += 2
	else:
		print("-1 point")
		TheGlobe.points -= 1


func clear_text():
	$Email_text.clear_text()


func _on_close_window_button_pressed() -> void:
	$PowerUp.play()
	self.hide()
	
