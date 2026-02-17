extends ScreenWrapper
class_name Rock
@onready var sprites: AnimatedSprite2D = $Sprites


var main: Main
var velocity: Vector2 = Vector2.ZERO # pixles / sec
@export var speed: float = 200



func _ready() -> void:
	area_entered.connect(on_area_entered)
	
	#velocity = Vector2(0,200) #test speed
	velocity = Vector2(randf_range(-speed, speed),randf_range(-speed, speed))
	sprites.frame = randi_range(0,2)


func _process(delta: float) -> void:
	position += velocity*delta
	super._process(delta)
	
func split():
	pass


func destroy():
	queue_free()

func on_area_entered(other_area: Area2D):
	print(other_area)
	if other_area is Bullet:
#		FIXME: crashes when ship and rock are both destroyed
#		currently in "Main" a ship, rock, and bullet all ocuppy the same space
		other_area.ship.player.update_score(20)
		other_area.destroy()
		self.destroy()

	elif other_area is Ship:
		other_area.destroy()
		
