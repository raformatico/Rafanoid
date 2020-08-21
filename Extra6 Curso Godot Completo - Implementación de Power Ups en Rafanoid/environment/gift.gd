extends RigidBody2D

onready var spr_gift_node : AnimatedSprite = $spr_gift

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spr_gift_node.frame = randi() % 2

func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()

func _on_gift_body_entered(body: Node) -> void:
	if body is Player:
		GLOBALS.emit_signal("gift_pickedup")
		queue_free()


