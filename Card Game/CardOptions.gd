extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("Right Click"):
		queue_free()
		Globals.butts = false
		get_parent().scale = Vector2(0.05, 0.05)


func _on_button_pressed():
	get_parent().queue_free()
	Globals.butts = false


func _on_button_2_pressed():
	if get_parent().is_in_group("One"):
		Globals.deckNumber = 0
		var cardname = get_parent().get_child(1)
		Globals.currentDeck[Globals.deckNumber].append(cardname.text)
		get_parent().queue_free()
		Globals.butts = false
	elif get_parent().is_in_group("Two"):
		Globals.deckNumber = 1
		var cardname = get_parent().get_child(1)
		Globals.currentDeck[Globals.deckNumber].append(cardname.text)
		get_parent().queue_free()
		Globals.butts = false




func _on_button_3_pressed():
	get_parent().get_child(7)._ready()
