extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player.play("cutscene")


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")
