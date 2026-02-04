extends Node2D
class_name Ship

var turn_spd = 180

func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	if Input.is_action_pressed("turn_ccw"):
		rotation_degrees -= turn_spd * delta
	if Input.is_action_pressed("turn_cw"):
		rotation_degrees += turn_spd * delta
#missing controls: fire, thrust, rapidfire
