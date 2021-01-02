extends Path

const Inimigo0 = preload("res://NPC/Inimigo/inimigo.tscn")

var velocidade=5
var tempo=1
var vida=1

func criar():
	
	$PathFollow.offset=randi() % 500 + 1
	var inutil=Inimigo0.instance()
	inutil.translation = $PathFollow.translation
	inutil.MovementSpeed=velocidade
	inutil.vida=vida
	get_parent().add_child(inutil)

func _on_Timer_timeout():
	criar()

func alterar():
	if $Timer.wait_time>0:
		$Timer.wait_time-=0.1
	velocidade+=5
	vida+=1

