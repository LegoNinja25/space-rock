extends ScreenWrapper
class_name Rock

var main: Main
var velocity: Vector2 = Vector2.ZERO # pixles / sec
@export var speed: float = 200



func _ready() -> void:
	#velocity = Vector2(0,200) #test speed
	velocity = Vector2(randf_range(-speed, speed),randf_range(-speed, speed))


func _process(delta: float) -> void:
	position += velocity*delta
	super._process(delta)
