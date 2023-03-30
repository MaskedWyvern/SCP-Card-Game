extends Button

var SCP0031 = preload("res://SCP0031.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	

func _on_button_3_pressed():
	print("SUMMONED SCP-003-1")
	var SCP = SCP0031.instantiate()
	get_parent().add_child(SCP)
