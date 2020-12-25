extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(float) var Acceleration = 3
export(float) var MovementSpeed = 5

var Speed = Vector3()
var Direction = Vector3()
var Movement = Vector3()
var CurrentVerticalSpeed = Vector3()
var gravity = -10
var JumpAcceleration = 3
var IsAirborne = false
var playerPerto = false
var vida=1

var ativar=false
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

func _physics_process(delta):
	if ativar:
		moverAtePlayer(delta)
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
func dano():
	vida-=1
	if vida<=0:
		queue_free()
		get_tree().get_root().get_node("Mapa/Player/Controller").p+=1
		get_tree().get_root().get_node("Mapa/Control/Pontos").text=String(get_tree().get_root().get_node("Mapa/Player/Controller").p)
	
func moverAtePlayer(delta):
	Direction=(get_tree().get_root().get_node("Mapa/Player").transform.origin-transform.origin).normalized()
	var MaxSpeed = MovementSpeed*Direction.normalized()*Vector3(1,0,1)
	Speed = Speed.linear_interpolate(MaxSpeed, delta * Acceleration)
	Movement = transform.basis * (Speed)
	CurrentVerticalSpeed.y += gravity * delta
	Movement += CurrentVerticalSpeed	
	move_and_slide(Movement,Vector3(0,1,0))
	if is_on_floor() :
		CurrentVerticalSpeed.y = 0
		IsAirborne = false


func _on_Timer_timeout():
	ativar=true
	pass # Replace with function body.
