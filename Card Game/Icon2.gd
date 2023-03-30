extends Sprite2D

var can_click = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var mouse_location = get_global_mouse_position();
	var mouseX = mouse_location.x
	var mouseY = mouse_location.y
	
	var MPOS = Vector2(mouseX, mouseY)
	
	if Input.get_mouse_button_mask() && can_click == true:
	
		position = MPOS

func _on_area_2d_mouse_entered():
	var SELECTSIZE = Vector2(2, 2)
	set_scale(SELECTSIZE)
	can_click = true;


func _on_area_2d_mouse_exited():
	var DSIZE = Vector2(1, 1)
	set_scale(DSIZE)
	can_click = false;
	
