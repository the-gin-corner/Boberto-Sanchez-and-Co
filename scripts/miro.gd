extends Friend

func _ready() -> void:
	friendName = "Miro"
	collisionState = false;


func _on_area_2d_body_entered(body: Node2D) -> void:
	collisionState = true
	print(collisionState)
	
	
	
func _on_area_2d_body_exited(body: Node2D) -> void:
	collisionState = false
	print(collisionState)
	
