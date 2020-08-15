extends CanvasLayer

onready var anim_play : AnimationPlayer = $AnimationPlayer

func change_scene_loc(path : String) -> void:
	layer = 1
	#fade in
	anim_play.play("fade")
	yield(anim_play,"animation_finished")
	#cambio de escena
	get_tree().change_scene(path)
	#fade out
	anim_play.play_backwards("fade")
	yield(anim_play,"animation_finished")
	layer = -1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	layer = -1

