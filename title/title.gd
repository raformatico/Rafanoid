extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var but_start : TextureButton = get_node("title_margin/menu/but_start/but")
	but_start.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_start_but_pressed():
	get_tree().change_scene("res://world.tscn")


func _on_quit_but_pressed():
	get_tree().quit()
