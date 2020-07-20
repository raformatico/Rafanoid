extends KinematicBody2D
class_name Player

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
	GLOBALS.connect("gift_picked",self,"_on_gift_gift_picked")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_pressed("mover_derecha"):
		var mouvement : Vector2 = Vector2(speed,0)
		move_and_collide(mouvement)
	if Input.is_action_pressed("mover_izquierda"):
		var mouvement : Vector2 = Vector2(-speed,0)
		move_and_collide(mouvement)

func _on_gift_gift_picked():
	gift_sound_node.play()
	
	
	
	
	
	
	
	
