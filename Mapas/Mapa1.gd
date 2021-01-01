extends Spatial

var up=false
var editaranimacao

func _ready():

	pass 

func _physics_process(delta):
	#passa level a cada 10 pontos teste	
	if int($Player/Controller.p)%10==0:
		if up:
			$Path.alterar()
			up=false
			print("Level UP")
	else:
		up=true
