extends Node2D

@export var key_time_on = 2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	var key_to_press = $AnimatedSprite2D.animation
	print("Key to press; from keys.gd: " + str(key_to_press))
	await get_tree().create_timer(key_time_on).timeout
	fade_out()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func correct():
	$AnimatedSprite2D.self_modulate = Color(0.0, 0.494, 0.0, 1.0)
	#fade_out()
#func wrong():
	#$AnimatedSprite2D.self_modulate = Color(0.494, 0, 0, 1.0)
# there could be a LOT of fdifferent reasons for wrong and for se other "right" characters.

func fade_out():
	#$AnimationPlayer.play("fade")
	#await get_tree().create_timer(2).timeout
	queue_free()
