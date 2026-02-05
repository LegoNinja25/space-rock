extends Node2D
class_name ScreenWrapper

func _process(delta: float) -> void:
	# screen wrap
	if position.x > get_viewport().size.x:
		position.x = 0
	elif position.x < 0:
		position.x = get_viewport().size.x

	if position.y > get_viewport().size.y:
		position.y = 0
	elif position.y < 0:
		position.y = get_viewport().size.y
