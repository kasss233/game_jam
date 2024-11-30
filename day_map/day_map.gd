extends Node2D

@onready var home_button = $back_to_home
@onready var home_text = $back_to_home/Label
@onready var shop_button = $change_to_shop
@onready var shop_text = $change_to_shop/Label
@onready var school_button = $go_to_school
@onready var school_text = $go_to_school/Label
@onready var work_button = $go_to_work
@onready var work_text = $go_to_work/Label
@onready var movie_button = $watch_movie
@onready var movie_text = $watch_movie/Label
@onready var library_button = $go_to_library
@onready var library_text = $go_to_library/Label
@onready var excise_button = $go_to_excise
@onready var excise_text = $go_to_excise/Label
@onready var playground_button = $go_to_playground
@onready var playground_text = $go_to_playground/Label
@onready var introduce = $introduce as Label
var dialog_tscn = preload("res://dialog_box/dialog_box.tscn")
var message_tscn = preload("res://message/message.tscn")
func _ready() -> void:

	home_text.size = home_button.size
	shop_text.size = shop_button.size
	school_text.size = school_button.size
	work_text.size = work_button.size
	movie_text.size = movie_button.size
	library_text.size = library_button.size
	excise_text.size = excise_button.size
	playground_text.size = playground_button.size



func _on_change_to_shop_pressed() -> void:
	get_tree().change_scene_to_file("res://shop/shop.tscn")


func _on_back_to_home_pressed() -> void:
	get_tree().change_scene_to_file("res://home/home.tscn")

func _on_go_to_school_pressed() -> void:	
	if GlobalVal.properties["mobility"] == 0:
		var message = message_tscn.instantiate()
		message.set_message(GlobalVal.random_zero_mobility_message())	
		message.set_time(1)
		message.set_color(Color.WHITE)
		self.add_child(message)
		message.start()
		return
	GlobalVal.add_property("knowledge",1)
	GlobalVal.minus_property("mood",1)
	GlobalVal.minus_property("mobility",1)
	get_tree().change_scene_to_file("res://activity_place/school.tscn")

func _on_go_to_work_pressed() -> void:	
	if GlobalVal.properties["mobility"] == 0:
		var message = message_tscn.instantiate()
		message.set_message(GlobalVal.random_zero_mobility_message())	
		message.set_time(1)
		message.set_color(Color.WHITE)
		self.add_child(message)
		message.start()
		return
	GlobalVal.minus_property("mood",1)
	GlobalVal.minus_property("mobility",1)
	GlobalVal.add_day_money(100)
	get_tree().change_scene_to_file("res://activity_place/work.tscn")


func _on_watch_movie_pressed() -> void:	
	if GlobalVal.properties["mobility"] == 0:
		var message = message_tscn.instantiate()
		message.set_message(GlobalVal.random_zero_mobility_message())	
		message.set_time(1)
		message.set_color(Color.WHITE)
		self.add_child(message)
		message.start()
		return
	if GlobalVal.money["day"] < 50:
		var node = message_tscn.instantiate()
		node.set_time(1)
		# node.set_color(Color.BLACK)
		node.set_message(GlobalVal.random_no_money_message())
		get_parent().add_child(node)
		node.global_position = Vector2(0,0)
		node.start()
		return
	GlobalVal.add_property("mood",1)
	GlobalVal.minus_property("mobility",1)
	GlobalVal.minus_day_money(50)
	get_tree().change_scene_to_file("res://activity_place/movie.tscn")

func _on_go_to_library_pressed() -> void:	
	if GlobalVal.properties["mobility"] == 0:
		var message = message_tscn.instantiate()
		message.set_message(GlobalVal.random_zero_mobility_message())	
		message.set_time(1)
		message.set_color(Color.WHITE)
		self.add_child(message)
		message.start()
		return
	GlobalVal.add_property("knowledge",1)
	GlobalVal.minus_property("stamina",1)
	GlobalVal.minus_property("mobility",1)
	get_tree().change_scene_to_file("res://activity_place/library.tscn")

func _on_go_to_excise_pressed() -> void:	
	if GlobalVal.properties["mobility"] == 0:
		var message = message_tscn.instantiate()
		message.set_message(GlobalVal.random_zero_mobility_message())	
		message.set_time(1)
		message.set_color(Color.WHITE)
		self.add_child(message)
		message.start()
		return
	GlobalVal.add_property("stamina",1)
	GlobalVal.add_property("mood",1)
	GlobalVal.minus_property("mobility",2)
	get_tree().change_scene_to_file("res://activity_place/excise.tscn")

func _on_go_to_playground_pressed() -> void:	
	if GlobalVal.properties["mobility"] == 0:
		var message = message_tscn.instantiate()
		message.set_message(GlobalVal.random_zero_mobility_message())	
		message.set_time(1)
		message.set_color(Color.WHITE)
		self.add_child(message)
		message.start()
		return
	GlobalVal.add_property("stamina",1)
	GlobalVal.minus_property("knowledge",1)
	GlobalVal.minus_property("mobility",1)
	get_tree().change_scene_to_file("res://activity_place/playground.tscn")

func _on_change_to_shop_mouse_entered() -> void:
	introduce.text = "去商店买点东西吧\n生活费-?"

func _on_change_to_shop_mouse_exited() -> void:
	introduce.text = ""

func _on_back_to_home_mouse_entered() -> void:
	introduce.text = "回家吧"

func _on_back_to_home_mouse_exited() -> void:
	introduce.text = ""

func _on_go_to_school_mouse_entered() -> void:
	introduce.text = "真的要去上课吗？\n心情-1\n知识+1\n行动力-1"

func _on_go_to_school_mouse_exited() -> void:
	introduce.text = ""

func _on_go_to_work_mouse_entered() -> void:
	introduce.text = "去干活吧\n心情-1\n生活费+100\n行动力-1\n可能会发生别的事情"

func _on_go_to_work_mouse_exited() -> void:
	introduce.text = ""

func _on_watch_movie_mouse_entered() -> void:
	introduce.text = "看场电影吧\n心情+1\n生活费-50\n行动力-1\n可能会发生别的事情"

func _on_watch_movie_mouse_exited() -> void:
	introduce.text = ""

func _on_go_to_library_mouse_entered() -> void:
	introduce.text = "去图书馆看书吧\n知识+1\n体质-1\n行动力-1\n可能会发生别的事情"

func _on_go_to_library_mouse_exited() -> void:
	introduce.text = ""

func _on_go_to_excise_mouse_entered() -> void:
	introduce.text = "去健身房锻炼一下吧\n心情+1\n体质+1\n行动力-2\n可能会发生别的事情"

func _on_go_to_excise_mouse_exited() -> void:
	introduce.text = ""

func _on_go_to_playground_mouse_entered() -> void:
	introduce.text = "去操场逛逛吧\n体质+1\n知识-1\n行动力-1\n可能会发生别的事情"

func _on_go_to_playground_mouse_exited() -> void:
	introduce.text = ""