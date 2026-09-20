extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $Area2D/CollisionShape2D



func _process(delta: float) -> void:
	animated_sprite_2d.play("stance")


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("Hello there, Boberto!")
	


func _on_area_2d_body_exited(body: Node2D) -> void:
	print("Goodbye, Boberto")
