extends ScreenWrapper
class_name Bullet

@onready var timer: Timer = $Timer

var player: Player
var speed = 500 #500 is good speed, 120 speed for testing


func _ready() -> void:
	timer.timeout.connect(on_timed_out)
	#rotation_degrees = 90


func _process(delta: float) -> void:
	super._process(delta)
	var direction = Vector2(sin(rotation), -cos(rotation))
	position += direction * speed * delta

func destroy():
	queue_free()

func on_timed_out():
	queue_free()
