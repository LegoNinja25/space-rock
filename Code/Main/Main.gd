extends Node
class_name Main

const ROCK = preload("res://Rock/Rock.tscn")
const UFO = preload("res://UFO/UFO.tscn")
const PLAYER = preload("res://Player/Player.tscn")

@onready var ufo_timer: Timer = $UfoTimer

var spawn_count: int = 3
var rocks: Array[Rock]


func _ready() -> void:
	ufo_timer.timeout.connect(spawn_ufo)
	
	
func start_round():
	spawn_rocks(spawn_count)
	spawn_player()
	ufo_timer.start()

func spawn_ufo():
	var ufo: = UFO.instantiate()
	add_child(ufo)

func spawn_player():
	var player = PLAYER.instantiate()
	add_child(player)

func spawn_rocks(count: int):
	for i in count:
		var rock = ROCK.instantiate()
		add_child(rock)
		rocks.append(rock)
	print("Rocks", rocks)


func is_game_over() -> bool:
	if rocks.is_empty():
		return true
	return false

func toggle_pause():
	pass
