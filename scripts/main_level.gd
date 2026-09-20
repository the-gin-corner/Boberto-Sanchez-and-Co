extends Node2D

@onready var boberto: CharacterBody2D = $boberto
@onready var camera_2d: Camera2D = %Camera2D

#NPCs
@onready var miro: CharacterBody2D = $miro
@onready var miroSprite: AnimatedSprite2D = $miro/AnimatedSprite2D

var friends = []

const NPC_STRINGS = [
	"Hello, Boberto. Going to the party yeah? Just make sure I don't sit next to Keno.",
	"Boberto! My man! It's been a bit. Can I sit next to Kamilba? She's pretty!",
	"Greetings, Boberto. It is a wonderful day, isn't it? Center view is the best.",
	"Bobert. May I request a front view? My eyes are weak.",
	"Bob. Up. I like uppies."
]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var bobertoPos = boberto.position.x
	print(bobertoPos)
	
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
	
	
	if bobertoPos > miro.position.x:
		miroSprite.flip_h = true
	else:
		miroSprite.flip_h = false
	
