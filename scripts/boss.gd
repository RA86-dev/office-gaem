extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"../AnimatedSprite2D".hide()

func blahblahblah():
	$"../AnimatedSprite2D".show()
	$"../AnimatedSprite2D".play("default")
	print("bal bla")
	var random = randi_range(10, 100)
	$"../boss/Boss'sBlahBlahBlah".play()
	TheGlobe.typingEnabled = false;
	print("Disabled typing!" + str(TheGlobe.typingEnabled))
	for i in random:
		$"../Email_window/Email_text".text += "blah "
		await get_tree().create_timer(.1 + randf_range(-.05, .15)).timeout
	$"../boss/Boss'sBlahBlahBlah".stop()
	TheGlobe.typingEnabled = true;
	$"../Email_window/Email_text".text = ""
	await get_tree().create_timer(.5).timeout
	$"../AnimatedSprite2D".hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#if Input.is_action_just_pressed("c"):
		#blahblahblah()
	pass
