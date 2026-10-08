extends Friend

@onready var icon: AnimatedSprite2D = $icon

func _ready() -> void:
	friendName = "Miro"
	collisionState = false
	icon.visible = false
	icon.play("bob")


func _on_area_2d_body_entered(body: Node2D) -> void:
	collisionState = true
	icon.visible = true
	print(collisionState)
	
	
	
func _on_area_2d_body_exited(body: Node2D) -> void:
	collisionState = false
	icon.visible = false
	print(collisionState)
	
