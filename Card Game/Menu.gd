extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$Button2.pressed.connect(GoToDeck)
	$Button.pressed.connect(GoToGame)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func GoToDeck():
	get_tree().change_scene_to_file("res://SUMMONTEST.tscn")

func GoToGame():
	get_tree().change_scene_to_file("res://game.tscn")


