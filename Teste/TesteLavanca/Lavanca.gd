extends Area


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
export(NodePath) var luz  = ""
var valor=0


func _on_Spatial_body_entered(body):
	
	get_node(luz).set_param(SpotLight.PARAM_ENERGY,valor)
	if valor==0:
		valor=1
	else:
		valor=0
	pass # Replace with function body.
