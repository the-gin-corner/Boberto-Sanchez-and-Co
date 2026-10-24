class_name DraggableNode
extends Node2D

var dragging = false
var offset = Vector2(0, 0)
var initialPos = Vector2(0, 0)

func _ready() -> void:
	add_to_group("Name Nodes")
