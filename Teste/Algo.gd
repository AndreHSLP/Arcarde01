extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var temp = 14

func texto(a):
	#$MeshInstance.set_scale(Vector3(2,1,1))
	$Viewport/Control/Label.set_text(String(a))
	#$Viewport.size=Vector2($Viewport/Control/Label.margin_right,$Viewport/Control/Label.margin_bottom)
	
	#$Viewport.size=Vector2($Viewport/Control/Label.get_total_character_count()*8,15)
	
	#print(String($Viewport.size)+":"+String(Vector2($Viewport/Control/Label.margin_right,$Viewport/Control/Label.margin_bottom)))
	
	

# Called when the node enters the scene tree for the first time.
func _ready():
	#$Viewport/Control/Label.text=String($Viewport/Control/Label.margin_bottom)+String($Viewport/Control/Label.margin_right)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
