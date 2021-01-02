extends Area

#func _ready():
#	pass 

export(NodePath) var luz  = ""
var valor=0

func _on_Spatial_body_entered(body):
	
	get_node(luz).set_param(SpotLight.PARAM_ENERGY,valor)
	if valor==0:
		valor=1
	else:
		valor=0
