extends CanvasLayer

onready var color_rec : ColorRect = $ColorRect
onready var tween_node : Tween = $Tween

func change_scene_loc(path : String) -> void:
	layer = 1
	#fade in
	tween_node.interpolate_property(color_rec,"color",
									Color("00000000"),
									Color("000000"),0.5)
	tween_node.start()
	yield(tween_node,"tween_completed")
	#change scene
	get_tree().change_scene(path)
	#fade out
	tween_node.interpolate_property(color_rec,"color",
									Color("000000"),
									Color("00000000"),0.5)
	tween_node.start()
	yield(tween_node,"tween_completed")
	layer = -1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	layer = -1
	pass # Replace with function body.
