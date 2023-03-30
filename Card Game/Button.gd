extends Node2D


var BlankDick = {}

var cardfinal = BlankDick

var blankcard = preload("res://SCPCARD.tscn")

const Deck1 = "user://deck"
const Deck2 = "user://deck2"

var SavePath = [Deck1, Deck2]


var DeckCount = 0


func _ready():
	LoadJson()
	$Button3.pressed.connect(SaveJson)
	$Button4.pressed.connect(LoadJson)
	$Button5.pressed.connect(DeleteJson)
	$Button6.pressed.connect(Back)
	$Button7.pressed.connect(OpenDeck1)
	$Button8.pressed.connect(OpenDeck2)
	$Button9.pressed.connect(DrawFromDeck)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("Backspace"):
		if CardDictionaries.deck.size() > 0:
			CardDictionaries.deck.pop_back()
			$VBoxContainer/Label.text = str(CardDictionaries.deck)
		else:
			pass

#This is what lets you drawfunc _on_button_pressed():
func _on_button_pressed():
	
	var card = randi_range(0,CardDictionaries.ALLCARDS.size() - 1)
	var cardresult = CardDictionaries.ALLCARDS.values()[card]
	var blank = blankcard.instantiate()
	add_child(blank)
	var Name = blank.get_child(1)
	var Type = blank.get_child(2)
	var Cost = blank.get_child(3)
	var Description = blank.get_child(4)
	var Defense = blank.get_child(5)
	var Attack = blank.get_child(6)
	Name.text = cardresult["Name"]
	Type.text = cardresult["Type"]
	Cost.text = str(cardresult["Cost"])
	Description.text = cardresult["Description"]
	Defense.text = str(cardresult["Defense"])
	Attack.text = str(cardresult["Attack"])
	cardfinal = cardresult
#This is what lets you search
func _on_line_edit_text_submitted(new_text):
	var input = new_text.to_upper().replace("-", "")
	if input in CardDictionaries.ALLCARDS:
		var cardresult = CardDictionaries.ALLCARDS[input]
		var blank = blankcard.instantiate()
		get_parent().add_child(blank)
		var Name = blank.get_child(1)
		var Type = blank.get_child(2)
		var Cost = blank.get_child(3)
		var Description = blank.get_child(4)
		var Defense = blank.get_child(5)
		var Attack = blank.get_child(6)
		Name.text = cardresult["Name"]
		Type.text = cardresult["Type"]
		Cost.text = str(cardresult["Cost"])
		Description.text = cardresult["Description"]
		Defense.text = str(cardresult["Defense"])
		Attack.text = str(cardresult["Attack"])
		cardfinal = cardresult
		$LineEdit.text = ""

	else:
		$LineEdit.text = "Invalid"



func _on_button_2_pressed():
	if cardfinal == BlankDick: 
		print("what")
	else:
		if CardDictionaries.deck.size() < 40:
			CardDictionaries.deck.append(cardfinal["Name"])
			$VBoxContainer/Label.text = str(CardDictionaries.deck)
		if CardDictionaries.deck.size() >= 40:
			print("can no longer add cards")
func SaveJson():
	var DeckDictionary = {
		"Deck" : CardDictionaries.deck
	}
	
	var json = JSON.stringify(DeckDictionary)
	var file = FileAccess.open(SavePath[DeckCount], FileAccess.WRITE)
	file.store_line(json)
	file.close()
	
func LoadJson():
	if not FileAccess.file_exists(SavePath[DeckCount]):
		return
	var file = FileAccess.open(SavePath[DeckCount], FileAccess.READ)
	var Data = file.get_line()
	var json : Dictionary = JSON.parse_string(Data)
	CardDictionaries.deck = json.Deck
	$VBoxContainer/Label.text = str(json.Deck)
	
	#deck = str_to_var(json.Deck)

func DeleteJson():
	CardDictionaries.deck.clear()
	$VBoxContainer/Label.text = str(CardDictionaries.deck)
	var DeckDictionary = {
		"Deck" : CardDictionaries.deck
	}
	
	var json = JSON.stringify(DeckDictionary)
	var file = FileAccess.open(SavePath[DeckCount], FileAccess.WRITE)
	file.store_line(json)
	file.close()

func Back():
	get_tree().change_scene_to_file("res://Menu.tscn")
	
func OpenDeck1():
	DeckCount = 0
	LoadJson()

func OpenDeck2():
	DeckCount = 1
	LoadJson()
	
func DrawFromDeck():
	var card = randi_range(0,CardDictionaries.deck.size() - 1)
	if CardDictionaries.deck.size() == 0:
		pass
	else:
		var finalCard = CardDictionaries.deck[card].replace("-","")
		var cardresult = CardDictionaries.ALLCARDS[finalCard]
		var blank = blankcard.instantiate()
		get_parent().add_child(blank)
		var Name = blank.get_child(1)
		var Type = blank.get_child(2)
		var Cost = blank.get_child(3)
		var Description = blank.get_child(4)
		var Defense = blank.get_child(5)
		var Attack = blank.get_child(6)
		Name.text = cardresult["Name"]
		Type.text = cardresult["Type"]
		Cost.text = str(cardresult["Cost"])
		Description.text = cardresult["Description"]
		Defense.text = str(cardresult["Defense"])
		Attack.text = str(cardresult["Attack"])
		cardfinal = cardresult
		CardDictionaries.deck.remove_at(card)
		$VBoxContainer/Label.text = str(CardDictionaries.deck)

