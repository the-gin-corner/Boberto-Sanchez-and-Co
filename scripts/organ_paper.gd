extends Control

@onready var correctArrangement = {
	"Lower Left": "Keno",
	"Lower Middle": "Kalimba",
	"Lower Right": "Tabs",
	"Upper Left": "Piri",
	"Upper Right": "Miro"
}

@onready var playerArrangement = {
	"Lower Left": "",
	"Lower Middle": "",
	"Lower Right": "",
	"Upper Left": "",
	"Upper Right": ""
}

var isUp = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	z_index = 5


## Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if playerArrangement == correctArrangement:
		Globals.correctPlacement = true

func assigningName(area: Area2D):
	var parentFriend = area.get_parent() as DraggableNode
	return parentFriend.friendName

#Area enters
func _on_point_1_area_entered(area: Area2D) -> void:
	var friendName = assigningName(area)
	playerArrangement["Upper Left"] = friendName

func _on_point_2_area_entered(area: Area2D) -> void:
	var friendName = assigningName(area)
	playerArrangement["Upper Right"] = friendName
	


func _on_point_3_area_entered(area: Area2D) -> void:
	var friendName = assigningName(area)
	playerArrangement["Lower Left"] = friendName
	


func _on_point_4_area_entered(area: Area2D) -> void:
	var friendName = assigningName(area)
	playerArrangement["Lower Middle"] = friendName
	
	

func _on_point_5_area_entered(area: Area2D) -> void:
	var friendName = assigningName(area)
	playerArrangement["Lower Right"] = friendName
	
	

#Area Exits
func _on_point_1_area_exited(area: Area2D) -> void:
	playerArrangement["Upper Left"] = ""
	

func _on_point_2_area_exited(area: Area2D) -> void:
	playerArrangement["Upper Right"] = ""
	

func _on_point_3_area_exited(area: Area2D) -> void:
	playerArrangement["Lower Left"] = ""
	

func _on_point_4_area_exited(area: Area2D) -> void:
	playerArrangement["Lower Middle"] = ""
	

func _on_point_5_area_exited(area: Area2D) -> void:
	playerArrangement["Lower Right"] = ""
