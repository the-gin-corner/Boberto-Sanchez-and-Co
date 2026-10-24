extends Node2D

@onready var boberto: CharacterBody2D = %boberto
@onready var camera_2d: Camera2D = %Camera2D
@onready var interaction_icon: AnimatedSprite2D = $"Interaction Icon"
@onready var timer: Timer = $Camera2D/Timer
@onready var notificationtimer: Timer = $Camera2D/Notificationtimer
@onready var transition_timer: Timer = $"Transition Timer"
@onready var charDialogue: Label = $Camera2D/Dialogue
@onready var charName: Label = $Camera2D/Name
@onready var organ_paper: Control = %OrganPaper
@onready var notifications: Control = %Notifications
@onready var jingle: AudioStreamPlayer2D = $"Final Area/Jingle"
@onready var walking_music: AudioStreamPlayer2D = $"Camera2D/Walking Music"
@onready var fail: AudioStreamPlayer2D = $Camera2D/Fail
@onready var fade: AnimationPlayer = $Fade


var cameraWidth
var alerts

func _ready() -> void:
	cameraWidth = 1200
	alerts = notifications.get_children()
		
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		for friend in get_tree().get_nodes_in_group("friends"):
			var dialogue = friend.dialogueDictionary
			if friend.collisionState:
				timer.start()
				charName.text = friend.friendName
				charDialogue.text = dialogue[friend.friendName]
				break
			
	if event.is_action_pressed("submit"):
		if organ_paper.isUp:
			if Globals.correctPlacement && Globals.inArea:
				Globals.win = true
				walking_music.stop()
				$ColorRect2.visible = true
				fade.play("fade")
				transition_timer.start()
			elif !Globals.inArea && Globals.correctPlacement:
				Globals.win = false
				alerts[1].visible = true
				notificationtimer.start()
				fail.play()
			elif !Globals.correctPlacement:
				Globals.win = false
				alerts[0].visible = true
				notificationtimer.start()
				fail.play()
			
			
			
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

func _on_final_area_body_entered(body: Node2D) -> void:
	Globals.inArea = true

func _on_notificationtimer_timeout() -> void:
	for alert in alerts:
		if alert.visible:
			alert.visible = false


func _on_transition_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://final_cutscene.tscn")
