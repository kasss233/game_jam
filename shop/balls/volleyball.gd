extends Node2D
@export var texture:Texture2D
var price = 100
var introduce = "排球\n价格：100元\n简介：足球是一种球形运动项目，球的大小和质量都很大，可以用来打篮球、踢足球、打网球、打羽毛球等。"
var enum_value = GlobalVal.sports.VOLLEYBALL

func change_state():
	GlobalVal.sports_list.append(GlobalVal.sports.VOLLEYBALL)
	pass