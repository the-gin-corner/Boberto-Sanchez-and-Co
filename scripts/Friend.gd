class_name Friend
extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@onready var dialogueDictionary = {
	"Miro": "Hello, Boberto. Going to the party yeah? Just make sure I don't sit next to Keno.",
	"Keno": "Boberto! My man! It's been a bit. Can I sit next to Kamilba? She's pretty!",
	"Kalimba": "Greetings, Boberto. It is a wonderful day, isn't it? Center view is the best.",
	"Tabs": "Bobert. May I request a front view? My eyes are weak.",
	"Piri": "Bob. Up. I like uppies."
}

var friendName

func _process(delta: float) -> void:
	animated_sprite_2d.play("stance")
