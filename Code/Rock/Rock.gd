extends Node2D
class_name Rock

var main: Main
var velocity: Vector2 = Vector2.ZERO # pixles / sec
@export var speed: float = 200



func _ready() -> void:
	#velocity = Vector2(0,200) #test speed
	velocity = Vector2(randf_range(-speed, speed),randf_range(-speed, speed))


func _process(delta: float) -> void:
	position += velocity*delta

# screen wrap
	if position.x > get_viewport().size.x:
		position.x = 0
	elif position.x < 0:
		position.x = get_viewport().size.x

	if position.y > get_viewport().size.y:
		position.y = 0
	elif position.y < 0:
		position.y = get_viewport().size.y
