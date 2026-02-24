extends Area2D
class_name UFO

@onready var up_down_timer: Timer = $UpDownTimer

var speed: float = 150 #pixels per second
var going_right: bool = false  
var velocity: Vector2 = Vector2.ZERO

func _ready() -> void:
	up_down_timer.timeout.connect(on_up_down)
	
	if randi() % 2:
		position.x = 0
		velocity.x = speed
	else: 
		position.x =get_viewport().size.x
		velocity.x = speed * -1
	position.y = randi_range(0, get_viewport().size.y)


func _process(delta: float) -> void:
	position += velocity * delta
	if position.x > get_viewport().size.x:
		destroy()
	if position.x < 0:
		destroy()
	
	if position.y > get_viewport().size.y:
		position.y = 0
	elif position.y < 0:
		position.y = get_viewport().size.y
	


func destroy():
	queue_free()

func on_up_down():
	if velocity.y == 0.0:
		if randi() % 2:
			velocity.y = speed
		else:
			velocity.y = speed * -1
	else:
		velocity.y = 0.0
