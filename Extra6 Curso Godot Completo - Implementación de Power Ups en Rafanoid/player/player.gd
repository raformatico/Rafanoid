extends KinematicBody2D
class_name Player

onready var powerup_timer_node : Timer = $powerup_timer
onready var spr_player_node : AnimatedSprite = $spr_player
onready var col_player_node : CollisionShape2D = $col_player
onready var gift_sound_node : AudioStreamPlayer2D = $gift_sound

const RIGHT : int = 1
const LEFT : int = -1

export var speed : int = 4

"""
func _input(event):
	if event.is_action_pressed("mover_derecha"):
		position.x = position.x + speed
	if event.is_action_pressed("mover_izquierda"):
		position.x = position.x - speed
"""

# Called when the node enters the scene tree for the first time.
func _ready():
	GLOBALS.connect("gift_pickedup",self,"_on_gift_pickedup")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_pressed("mover_derecha"):
		var mouvement : Vector2 = Vector2(speed,0)
		move_and_collide(mouvement)
	if Input.is_action_pressed("mover_izquierda"):
		var mouvement : Vector2 = Vector2(-speed,0)
		move_and_collide(mouvement)

func enable_powerup() -> void:
	#Start timer
	powerup_timer_node.start()
	#Change frame of Animated Sprite
	spr_player_node.frame = 1
	#Change size of Collision Shape2D
	col_player_node.shape.extents.x = 38
	#Emit the sound
	gift_sound_node.play()

func disable_powerup() -> void:
	#Change frame of Animated Sprite
	spr_player_node.frame = 0
	#Change size of Collision Shape2D
	col_player_node.shape.extents.x = 32
	

func _on_gift_pickedup() -> void:
	enable_powerup()
	
func _on_powerup_timer_timeout() -> void:
	disable_powerup()
	






