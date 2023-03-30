extends Button

var SCP0032 = preload("res://SCP0032.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_button_2_pressed():
	print("SUMMONED SCP-003-2")
	var SCP = SCP0032.instantiate()
	get_parent().add_child(SCP)
	
