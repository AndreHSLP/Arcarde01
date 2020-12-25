extends Path



const Inimigo0 = preload("res://NPC/Inimigo/inimigo.tscn")

var velocidade=5
var tempo=1
var vida=1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func criar():
	
	$PathFollow.offset=randi() % 500 + 1
	var inutil=Inimigo0.instance()
	inutil.translation = $PathFollow.translation
	inutil.MovementSpeed=velocidade
	inutil.vida=vida
	get_parent().add_child(inutil)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	criar()
	pass # Replace with function body.

func alterar():
	if $Timer.wait_time>0:
		$Timer.wait_time-=0.1
	velocidade+=5
	vida+=1
	pass
