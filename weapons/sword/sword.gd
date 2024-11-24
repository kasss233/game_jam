extends Node2D
@onready var animation = $AnimationPlayer
@onready var sprite = $sprite
@onready var timer = $Timer
@onready var sword_sprite = $sprite/Sprite2D
@onready var bullet_pos = $sprite/Sprite2D/bullet_position
@export var data: WeaponDatas = null
var direction = Vector2.ZERO
var reloading: bool = false
var initial_position
func _ready() -> void:
	#if GlobalVal.player["weapon"]!=GlobalVal.weapons.AK47:
		#queue_free()
	if !data.enabled:
		queue_free()
	init()
func _physics_process(delta) -> void:
	update_position()
	update_rotation()
	pass

	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("attack"):
		if direction.x >= 0:
			animation.play("sword_attack_right")
		if direction.x < 0:
			animation.play("sword_attack_left")
	
func update_rotation():
	direction = (get_global_mouse_position() - sword_sprite.global_position).normalized()
	sword_sprite.rotation = direction.angle()
	if direction.x > 0:
		sword_sprite.scale.y = 0.6 # 正常缩放（朝右挥）
	else:
		sword_sprite.scale.y = 0.6 # 同方向缩放（朝左挥）
		sword_sprite.rotation += PI # 朝左时旋转 180 度，调整方向
	
func init():
	data.damage = GlobalVal.sword["damage"]
	direction = Vector2.ZERO
	initial_position = sprite.position

func _on_area_2d_body_entered(body: Node2D) -> void:
	body.get_attack(data.damage)
	
func update_position():
	if GlobalVal.player["direction"].x > 0:
		sprite.position = initial_position
	if GlobalVal.player["direction"].x < 0:
		sprite.position.x = initial_position.x - 15
