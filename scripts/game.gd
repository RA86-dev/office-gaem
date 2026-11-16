extends Node2D

const KEYS = preload("uid://dwpe2xcblraow")

var time_inbetween_key_spawn = .5

#var miss_penelty = -1
#var wrong_penalty = -1
var points = 0


var press_letters = []

var keys_that_are_new = []

func button_press():
	$Email_window.show()
	$Blip.play()
# Called when the node enters the scene tree for the first time.

func game_loop(): 
	$Blip.play()
	$Email_window.show()
	await $boss.blahblahblah()
	await get_tree().create_timer(.2).timeout
	generate_multi_keys(randi_range(20, 30))
	await get_tree().create_timer(17).timeout
	paycheck()
	await get_tree().create_timer(4).timeout
	$"Paycheck window".hide()
	
	while (TheGlobe.points / 10) + 14.0 > 0:
		$"Paycheck window/Label".text = ""
		await $boss.blahblahblah()
		await get_tree().create_timer(.2).timeout
		generate_multi_keys(randi_range(20, 30))
		await get_tree().create_timer(17).timeout
		paycheck()
		await get_tree().create_timer(4).timeout
		$"Paycheck window".hide()
	
	$fired.show()
	$AnimationPlayer.play("fadein")
	print("you lose")


func paycheck():
	$"Paycheck window".show()
	$"Paycheck window".position = Vector2(296, 840)
	while $"Paycheck window".position.y > 600:
		$"Paycheck window".position.y -= 10
	
	
	var income: float = (TheGlobe.points / 10) + 14.0
	$"Paycheck window/Label".text = "Your income is.... $"+ str(income) + "!"
	await get_tree().create_timer(3).timeout



func _ready() -> void:
	pass
	$fired.hide()
	$Email_window.hide()
	$"Paycheck window".hide()
	$logo_button.connect("button_down", game_loop)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	#if Input.is_action_just_pressed("r"):
		#generate_multi_keys(50 + randi_range(-2, 2))
	
	#$Label.text = str(TheGlobe.points)
	
	
	


var rng = RandomNumberGenerator.new()

func generate_one_key() -> String:
	# Generates a single key that is available.
	var available_keys = ["E", "M", "P", "V", "Y"]
	var weights: Array[int] = []
	weights.resize(available_keys.size())
	weights.fill(1)
	print("Weights: " + ",".join(weights))
	
	var value = available_keys[rng.rand_weighted(weights)]
	return value



func generate_multi_keys(length: int) -> Array[String]:
	
	# Generates multiple keys that can be generated; length is determinable by user.
	var output: Array[String] = []
	for n in length:
		var generated_key: String = generate_one_key()
		print("Generated Key Result: " + str(generated_key))
		output.append(generated_key)
	add_keys(output)
	return output


# TODO: Display the keys
# TODO: Listen for the input keys and compare;




func add_keys(input_keys: Array[String]):
	
	for i in input_keys.size():
		
		var new_keys = KEYS.instantiate()
		var randi_pos = Vector2(randf_range(360, 900), 500)# randf_range(160, 550))
		
		new_keys.position = randi_pos
		
		keys_that_are_new.append(new_keys)
		print(new_keys.get_node("AnimatedSprite2D"), " hhhiiiiiiiii")
		
		
		add_child(new_keys)
		new_keys.get_node("AnimatedSprite2D").play(input_keys[i])
		
		TheGlobe.keys_reeeee.append(new_keys.get_node("AnimatedSprite2D"))
		
		#press_letters.append(input_keys[i])
		await get_tree().create_timer(time_inbetween_key_spawn + randf_range(-.1, .2)).timeout
	TheGlobe.keys_to_press.append_array(input_keys)
	
