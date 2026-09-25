extends Node2D

@onready var boberto: CharacterBody2D = %boberto
@onready var camera_2d: Camera2D = %Camera2D
@onready var timer: Timer = $Camera2D/Timer
@onready var charDialogue: Label = $Camera2D/Dialogue
@onready var charName: Label = $Camera2D/Name


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

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var bobertoPos = boberto.position.x
	
	#Camera switching between screens
	#-------
	#Surely there is a better way to do this lol
	if bobertoPos < 1200:
		camera_2d.position.x = 0
	else:
		if bobertoPos > 1200 && bobertoPos < 2400:
			camera_2d.position.x = 1200
		if bobertoPos > 2400 && bobertoPos < 3600:
			camera_2d.position.x = 2400
		if bobertoPos > 3600 && bobertoPos < 4800:
			camera_2d.position.x = 3600
		if bobertoPos > 4800 && bobertoPos < 6000:
			camera_2d.position.x = 4800
		if bobertoPos > 6000 && bobertoPos < 7200:
			camera_2d.position.x = 6000
		if bobertoPos > 7200 && bobertoPos < 8400:
			camera_2d.position.x = 7200
		if bobertoPos > 8400 && bobertoPos < 9600:
			camera_2d.position.x = 8400
		if bobertoPos > 9600 && bobertoPos < 10800:
			camera_2d.position.x = 9600
		if bobertoPos > 10800:
			camera_2d.position.x = 10800
	
	#Handling NPC sprite flipping
	for friend in get_tree().get_nodes_in_group("friends"):
		var sprite = friend.get_node_or_null("AnimatedSprite2D") as AnimatedSprite2D
		
		if bobertoPos > friend.position.x:
			sprite.flip_h = true
		else:
			sprite.flip_h = false
	


func _on_timer_timeout() -> void:
	charName.text = ""
	charDialogue.text = ""
