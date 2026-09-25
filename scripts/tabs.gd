extends Friend

func _ready() -> void:
	friendName = "Tabs"
	collisionState = false;


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("Hello there, Boberto!")
	collisionState = true
	


func _on_area_2d_body_exited(body: Node2D) -> void:
	print("Goodbye, Boberto!")
	collisionState = false
