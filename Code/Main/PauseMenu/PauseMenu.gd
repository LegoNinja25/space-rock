extends PanelContainer
class_name PauseMenu

@onready var play: Button = $VBoxContainer/Play
@onready var quit: Button = $VBoxContainer/Quit

func _ready() -> void:
	play.pressed.connect(on_play_pressed)
	quit.pressed.connect(on_quit_pressed)
	hide()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		get_tree().paused = !get_tree().paused
		self.visible = get_tree().paused

func on_play_pressed():
	get_tree().paused = false
	hide()
func on_quit_pressed():
	get_tree().quit()
