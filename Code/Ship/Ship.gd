extends ScreenWrapper
class_name Ship


const BULLET = preload("res://Bullet/Bullet.tscn")
@onready var flame: Polygon2D = $Flame


var thrust_pwr: float = 250
var turn_spd: float = 250
var velocity: Vector2 = Vector2.ZERO


func _ready() -> void:
	flame.hide()

func _process(delta: float) -> void:
	if Input.is_action_pressed("turn_ccw"):
		rotation_degrees -= turn_spd * delta
	if Input.is_action_pressed("turn_cw"):
		rotation_degrees += turn_spd * delta
		
	if Input.is_action_pressed("thrust"):
		var direction = Vector2(sin(rotation), -cos(rotation))
		velocity += direction * thrust_pwr * delta
		flame.show()
		#print("Thrust")
	if Input.is_action_just_released("thrust"):
		flame.hide()
		
	if Input.is_action_just_pressed("fire"):
		#spawn bullet, pos, ....
		var bullet: Bullet = BULLET.instantiate()
		bullet.rotation = self.rotation
		bullet.position = self.position
		self.get_parent().add_child(bullet)
		#print("pew")

	#if Input.is_action_just_pressed("rapidfire"):
		#var bullet: Bullet = BULLET.instantiate()
		#bullet.rotation = self.rotation
		#bullet.position = self.position
		#self.get_parent().add_child(bullet)
		#print("pewpew")
		
	position += velocity * delta
	super._process(delta)
