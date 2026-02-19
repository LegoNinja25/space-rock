extends ScreenWrapper
class_name Rock
@onready var sprites: AnimatedSprite2D = $Sprites

var scoreno: int = 20
var main: Main
var velocity: Vector2 = Vector2.ZERO # pixles / sec
@export var speed: float = 180

const ROCK = preload("res://Rock/Rock.tscn")


func _ready() -> void:
	area_entered.connect(on_area_entered)
	
	#velocity = Vector2(0,200) #test speed
	velocity = Vector2(randf_range(-speed, speed),randf_range(-speed, speed))
	sprites.frame = randi_range(0,2)


func _process(delta: float) -> void:
	position += velocity*delta
	super._process(delta)
	
func split():
	if scale.x > 0.25:
		for i in 2:
			var rock: Rock = ROCK.instantiate()
			rock.position = position
			rock.scale = scale * 0.50
			self.get_parent().add_child(rock)
			


func destroy():
	queue_free()

func on_area_entered(other_area: Area2D):
	#print(other_area)
	if other_area is Bullet:
		if other_area.player.ship == null:
			other_area.player.update_score(scoreno*0.5)
		elif other_area.player.ship != null:
			other_area.player.update_score(scoreno)
		
		#if other_area.player != null:
			#other_area.player.update_score(20)
		other_area.destroy()
		self.call_deferred("split")
		self.destroy()

	elif other_area is Ship:
		other_area.destroy()
#TODO: puting this here cause why not
#variable score base of size
#limited lives
#resapwing rocks when all are destroyed
#UFO?
#animated ship flame
