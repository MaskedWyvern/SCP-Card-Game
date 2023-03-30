extends Button

var SCP002 = preload("res://SCP002.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_button_pressed():
	print("SUMMONED SCP-002")
	var SCP = SCP002.instantiate()
	get_parent().add_child(SCP)
	
