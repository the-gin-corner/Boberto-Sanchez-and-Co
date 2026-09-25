extends Friend

func _ready() -> void:
	friendName = "Piri"
	collisionState = false;


func _on_area_2d_body_entered(body: Node2D) -> void:
	collisionState = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	collisionState = false
