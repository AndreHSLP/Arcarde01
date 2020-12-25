extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var alvo
var direcao = Vector3(0,0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if alvo:
		if is_instance_valid(alvo):
			self.look_at(Vector3(alvo.translation.x,0,alvo.translation.z), Vector3(0,1,0)) 
			set_rotation(Vector3(0, get_rotation().y, 0))
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_Detec_body_entered(body):
	if get_parent()!=body:
		alvo=body
	pass # Replace with function body.
