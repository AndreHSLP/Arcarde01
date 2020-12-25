extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocidade= Vector3(100,0,100)


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

func _physics_process(delta):
	translation += velocidade*-global_transform.basis.z*delta
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	pass



func _on_Area_body_entered(body):
	if "inimigo" in body.get_name():
		body.dano()
		queue_free()
	pass # Replace with function body.


func _on_Timer_timeout():
	queue_free()

	pass # Replace with function body.
