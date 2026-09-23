extends Friend

func _ready() -> void:
	friendName = "Tabs"



func _on_area_2d_body_entered(body: Node2D) -> void:
	print("Hello there, Boberto!")


func _on_area_2d_body_exited(body: Node2D) -> void:
	print("Goodbye, Boberto!")
