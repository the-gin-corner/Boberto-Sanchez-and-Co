extends Node2D

@onready var boberto: CharacterBody2D = %boberto
@onready var camera_2d: Camera2D = %Camera2D
@onready var timer: Timer = $Camera2D/Timer
@onready var charDialogue: Label = $Camera2D/Dialogue
@onready var charName: Label = $Camera2D/Name

@onready var correctArrangement = {
	"Lower Left": "Keno",
	"Lower Middle": "Kalimba",
	"Lower Right": "Tabs",
	"Upper Left": "Piri",
	"Upper Right": "Miro"
}

var cameraWidth

func _ready() -> void:
	cameraWidth = 1200

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		for friend in get_tree().get_nodes_in_group("friends"):
			var dialogue = friend.dialogueDictionary
			if friend.collisionState:
				timer.start()
				charName.text = friend.friendName
				charDialogue.text = dialogue[friend.friendName]
				break
			
			#print("{0}: {1}".format([friend.name, friend.collisionState]))

func _process(delta: float) -> void:
	var bobertoPos = boberto.position.x
	
	#Handling NPC sprite flipping
	for friend in get_tree().get_nodes_in_group("friends"):
		var sprite = friend.get_node_or_null("AnimatedSprite2D") as AnimatedSprite2D
		
		if bobertoPos > friend.position.x:
			sprite.flip_h = true
		else:
			sprite.flip_h = false
	
	switchRooms()
	

#Credit to DevDrache on YouTube for the mini tutorial on this
func switchRooms():
	var bobertoPos = boberto.global_position.x
	var cameraPos = camera_2d.global_position.x
	
	var right = bobertoPos > cameraPos + cameraWidth
	var left = bobertoPos < cameraPos
	
	if right:
		camera_2d.global_position.x += cameraWidth
	elif left:
		camera_2d.global_position.x -= cameraWidth

func _on_timer_timeout() -> void:
	charName.text = ""
	charDialogue.text = ""
