extends ColorRect

var can_click = false;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var mouse_location = get_global_mouse_position();
	var mouseX = mouse_location.x
	var mouseY = mouse_location.y
	
	var MPOS = Vector2(mouseX, mouseY)
	
	if Input.is_action_pressed("Mouse click") && can_click == true:
		position = MPOS
		
	if Input.is_action_pressed("Mouse click") && can_click == false:
		if is_in_group("Clicked"):
			remove_from_group("Clicked")
			add_to_group("Unclicked")
		
	if Input.is_action_just_released("Mouse click"):
		if is_in_group("Unclicked"):
			add_to_group("Clicked")
			remove_from_group("Unclicked")
	
func _on_area_2d_mouse_entered():
	
	if is_in_group("Clicked"):
		var SELECTSIZE = Vector2(0.1, 0.1)
		set_scale(SELECTSIZE)
		can_click = true;
		z_index = 1
	else:
		pass
	
func _on_area_2d_mouse_exited():
	var DSIZE = Vector2(0.05, 0.05)
	set_scale(DSIZE)
	can_click = false;
	z_index = 0
