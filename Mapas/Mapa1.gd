extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var up=false
var editaranimacao
# Called when the node enters the scene tree for the first time.
func _ready():

	
	#Engine.time_scale=0.5
	pass # Replace with function body.

func _physics_process(delta):
	

	
	if int($Player/Controller.p)%10==0:
		if up:
			$Path.alterar()
			up=false
			print("Level UP")
	else:
		up=true
		
		
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
