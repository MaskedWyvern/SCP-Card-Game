extends Node2D

const Deck1 = "user://deck"
const Deck2 = "user://deck2"

var blankcard = preload("res://SCPCARD.tscn")

var Test = preload("res://TestCard.gd")

# Called when the node enters the scene tree for the first time.
func _ready():
	$Label3.visible = false
	decksLoad()
	$Button2.pressed.connect(deck1)
	$Button.pressed.connect(deck2)
	$Button3.pressed.connect(Back)
	$Button4.pressed.connect(AtkDef)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$Label.text = "cards in deck: " + str(CardDictionaries.deck2.size())
	$Label2.text = "cards in deck: " + str(CardDictionaries.deck.size())
func decksLoad():
	if not FileAccess.file_exists(Deck1):
		return
	var file = FileAccess.open(Deck1, FileAccess.READ)
	var Data = file.get_line()
	var json : Dictionary = JSON.parse_string(Data)
	CardDictionaries.deck = json.Deck
	Globals.currentDeck[0] = CardDictionaries.deck
	if not FileAccess.file_exists(Deck2):
		return
	var file2 = FileAccess.open(Deck2, FileAccess.READ)
	var Data2 = file2.get_line()
	var json2 : Dictionary = JSON.parse_string(Data2)
	CardDictionaries.deck2 = json2.Deck
	Globals.currentDeck[1] = CardDictionaries.deck2
	
func deck1():
	var card = randi_range(0,CardDictionaries.deck.size() - 1)
	if CardDictionaries.deck.size() == 0:
		print("No More Cards")
	else:
		var finalCard = CardDictionaries.deck[card].replace("-","")
		var cardresult = CardDictionaries.ALLCARDS[finalCard]
		var blank = blankcard.instantiate()
		add_child(blank)
		var Name = blank.get_child(1)
		var Type = blank.get_child(2)
		var Cost = blank.get_child(3)
		var Description = blank.get_child(4)
		var Defense = blank.get_child(5)
		var Attack = blank.get_child(6)
		var Srt = blank.get_child(7)
		Name.text = cardresult["Name"]
		Type.text = cardresult["Type"]
		Cost.text = str(cardresult["Cost"])
		Description.text = cardresult["Description"]
		Defense.text = str(cardresult["Defense"])
		Attack.text = str(cardresult["Attack"])
		var nScript = cardresult["script"]
		if nScript == null:
			pass
		else:
			Srt.set_script(nScript)
		CardDictionaries.deck.remove_at(card)
		blank.add_to_group("One")
func deck2():
	var card = randi_range(0,CardDictionaries.deck2.size() - 1)
	if CardDictionaries.deck2.size() == 0:
		print("No More Cards")
		print(Globals.currentDeck.size())
	else:
		var finalCard = CardDictionaries.deck2[card].replace("-","")
		var cardresult = CardDictionaries.ALLCARDS[finalCard]
		var blank = blankcard.instantiate()
		add_child(blank)
		var Name = blank.get_child(1)
		var Type = blank.get_child(2)
		var Cost = blank.get_child(3)
		var Description = blank.get_child(4)
		var Defense = blank.get_child(5)
		var Attack = blank.get_child(6)
		var Srt = blank.get_child(7)
		Name.text = cardresult["Name"]
		Type.text = cardresult["Type"]
		Cost.text = str(cardresult["Cost"])
		Description.text = cardresult["Description"]
		Defense.text = str(cardresult["Defense"])
		Attack.text = str(cardresult["Attack"])
		var nScript = cardresult["script"]
		if nScript == null:
				pass
		else:
			Srt.set_script(nScript)
		CardDictionaries.deck2.remove_at(card)
		blank.add_to_group("Two")
func Back():
	get_tree().change_scene_to_file("res://Menu.tscn")
	print(str(CardDictionaries.ALLCARDS.size()))

func _on_line_edit_text_submitted(new_text):
		var input = new_text.to_upper().replace("-", "")
		if input in CardDictionaries.ALLCARDS:
			var cardresult = CardDictionaries.ALLCARDS[input]
			var blank = blankcard.instantiate()
			add_child(blank)
			var Name = blank.get_child(1)
			var Type = blank.get_child(2)
			var Cost = blank.get_child(3)
			var Description = blank.get_child(4)
			var Defense = blank.get_child(5)
			var Attack = blank.get_child(6)
			var Srt = blank.get_child(7)
			Name.text = cardresult["Name"]
			Type.text = cardresult["Type"]
			Cost.text = str(cardresult["Cost"])
			Description.text = cardresult["Description"]
			Defense.text = str(cardresult["Defense"])
			Attack.text = str(cardresult["Attack"])
			var nScript = cardresult["script"]
			if nScript == null:
				pass
			else:
				Srt.set_script(nScript)
			$LineEdit.text = ""

		else:
			$LineEdit.text = "Invalid"

func AtkDef():
	$Label3.visible = true
