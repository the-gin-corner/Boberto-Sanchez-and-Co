extends Node2D

@onready var boberto: CharacterBody2D = %boberto
@onready var camera_2d: Camera2D = %Camera2D

#NPCs
#---
#Miro
@onready var miro: Friend = $NPCs/miro
@onready var miroSprite: AnimatedSprite2D = $NPCs/miro/AnimatedSprite2D

#Keno
@onready var keno: Friend = $NPCs/keno
@onready var kenoSprite: AnimatedSprite2D = $NPCs/keno/AnimatedSprite2D

#Kalimba
@onready var kalimba: CharacterBody2D = $NPCs/kalimba
@onready var kalimbaSprite: AnimatedSprite2D = $NPCs/kalimba/AnimatedSprite2D


#Tabs
@onready var tabs: Friend = $NPCs/tabs
@onready var tabsSprite: AnimatedSprite2D = $NPCs/tabs/AnimatedSprite2D


#Piri
@onready var piri: Friend = $NPCs/piri
@onready var piriSprite: AnimatedSprite2D = $NPCs/piri/AnimatedSprite2D


@onready var friendsAndSprites = {
	miro: miroSprite,
	keno: kenoSprite,
	kalimba: kalimbaSprite,
	tabs: tabsSprite,
	piri: piriSprite
}


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


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
	for friend in friendsAndSprites:
		if bobertoPos > friend.position.x:
			friendsAndSprites[friend].flip_h = true
		else:
			friendsAndSprites[friend].flip_h = false
	
