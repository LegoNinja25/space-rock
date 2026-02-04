extends Node2D
class_name Bullet

var ship: Ship
var speed = 500 #500 is good speed, 120 speed for testing


#func _ready() -> void:
	#rotation_degrees = 90


func _process(delta: float) -> void:
	var direction = Vector2(sin(rotation), -cos(rotation))
	position += direction * speed * delta
