extends Friend

@onready var icon: AnimatedSprite2D = $icon

func _ready() -> void:
	friendName = "Tabs"
	collisionState = false
	icon.visible = false
	icon.play("bob")


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("Hello there, Boberto!")
	collisionState = true
	icon.visible = true
	


func _on_area_2d_body_exited(body: Node2D) -> void:
	print("Goodbye, Boberto!")
	collisionState = false
	icon.visible = false
