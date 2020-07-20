extends RigidBody2D

onready var break_s : AudioStreamPlayer = get_node("break")
onready var start_s : AudioStreamPlayer = get_node("start")
onready var you_win_s : AudioStreamPlayer = get_node("you_win")
onready var lose_s : AudioStreamPlayer = get_node("lose")
onready var hit_s : AudioStreamPlayer = get_node("hit")

const SPEED_X = 70
const SPEED_Y = -300

var game_started : bool = false


func _input(event):
	if event.is_action_pressed("iniciar") and not game_started:
		linear_velocity = Vector2(SPEED_X,SPEED_Y)
		game_started = true
		start_s.play()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	for body in get_colliding_bodies():
		if body.is_in_group("gr_blocks"):
			hit_block(body)
		elif body.get_name() == "bord_bot":
			hit_bot(body)
		else:
			hit_regular(body)

func hit_block(body):
	body.queue_free()
	break_s.play()
	if body.get_parent().get_child_count() == 1:
		print("GANA")
		you_win_s.play()
		get_tree().paused = true
		yield(you_win_s,"finished")
		queue_free()
		var replay_scn = load("res://title/replay.tscn")
		get_parent().add_child(replay_scn.instance())

func hit_bot(body):
	print("PIERDE")
	get_tree().paused = true
	lose_s.play()
	yield(lose_s,"finished")
	queue_free()
	var replay_scn = load("res://title/replay.tscn")
	get_parent().add_child(replay_scn.instance())
	
func hit_regular(body):
	hit_s.play()
