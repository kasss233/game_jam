extends Control

@export var bgm:AudioStream

func _ready() -> void:
	effect()
	AudioPlayer.button_se_init(self)
func _on_button_pressed() -> void: ## 更换场景，产生增益
	GlobalVal.add_day()
	if GlobalVal.weekday == GlobalVal.week.LASTDAY:
		SceneChanger.change_scene(load("res://end/end.tscn"))
	else:
		SceneChanger.change_scene(load("res://home/home.tscn"))
func effect():
	GlobalVal.add_property("stamina", 1)
	GlobalVal.add_property("mood", 1)
	GlobalVal.add_property("knowledge", 1)

func _process(delta):
	if bgm!= null:
		AudioPlayer.play_bgm(bgm)
