extends Spatial

###########
#bala teste
#var test=preload("res://Velocidade.tscn")
var Parado=false
########

export(NodePath) var PlayerPath  = "" #You must specify this in the inspector!
export(float) var MovementSpeed = 10
export(float) var Acceleration = 3
export(float) var MaxJump = 19
export(float) var MouseSensitivity = 2
export(float) var RotationLimit = 45
export(float) var MaxZoom = 0.5
export(float) var MinZoom = 1.5
export(float) var ZoomSpeed = 2

var Player
var InnerGimbal
var Direction = Vector3()
var Rotation = Vector2()
var gravity = -10
var Movement = Vector3()
var ZoomFactor = 1
var ActualZoom = 1
var Speed = Vector3()
var CurrentVerticalSpeed = Vector3()
var JumpAcceleration = 3
var IsAirborne = false

const bala1 = preload("res://Bala/Velocidade.tscn")
var p=0

func _ready():
	#get_parent().
	
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	Player = get_node(PlayerPath)
	InnerGimbal =  $InnerGimbal
	get_parent().get_node("Algo").texto("Player01")
	
	pass

func _unhandled_input(event):
	
	if event is InputEventMouseMotion :
		Rotation = event.relative
	
	if event is InputEventMouseButton:
		match event.button_index:
			BUTTON_WHEEL_UP:
				ZoomFactor -= 0.05
			BUTTON_WHEEL_DOWN:
				ZoomFactor += 0.05
		ZoomFactor = clamp(ZoomFactor, MaxZoom, MinZoom)
	
	if Input.is_action_just_pressed("ui_home"):
		
		if !Parado:
			set_pause_mode(PAUSE_MODE_PROCESS)
		else:
			set_pause_mode(PAUSE_MODE_STOP)
			
		get_tree().paused=!Parado
		Parado=!Parado
		print(Parado)
		
		
		
		#if Input.get_mouse_mode()==Input.MOUSE_MODE_CAPTURED:
			#Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			#$Inventario.visible=true
		#else:
			#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			#$Inventario.visible=false
##################################
#	if event is InputEventKey and event.pressed:
#		match event.scancode:
#			KEY_ESCAPE:
#				get_tree().quit()
#			KEY_W: #FORWARD
#				Direction.z -= 1
#			KEY_S: #BACKBAWRD
#				Direction.z += 1
#			KEY_A: #LEFT
#				Direction.x -= 1
#			KEY_D: #RIGHT
#				Direction.x += 1
#	if event is InputEventKey and not event.pressed:
#		match event.scancode:
#			KEY_W:
#				Direction.z += 1
#			KEY_S:
#				Direction.z -= 1
#			KEY_A:
#				Direction.x += 1
#			KEY_D:
#				Direction.x -= 1
#			KEY_SPACE:
#				if not IsAirborne:
#					CurrentVerticalSpeed = Vector3(0,MaxJump,0)
#					IsAirborne = true
	Direction.z=0
	Direction.x=0
	#var input_movement_vector = Vector2()
	if Input.get_mouse_mode()==Input.MOUSE_MODE_CAPTURED:
		if Input.is_action_pressed("movement_forward"):
			Direction.z -= 1
		if Input.is_action_pressed("movement_backward"):
			Direction.z += 1
		if Input.is_action_pressed("movement_left"):
			Direction.x -= 1
		if Input.is_action_pressed("movement_right"):
			Direction.x += 1	
		if Input.is_action_just_pressed("movement_jump"):
			if not IsAirborne:
				CurrentVerticalSpeed = Vector3(0,MaxJump,0)
				IsAirborne = true

##########################		
#	Atirar bala teste
#		if Input.is_key_pressed(KEY_1):
#			var bala=test.instance()
#			bala.rotation=-get_global_transform().basis.z
#			bala.translation = get_parent().translation
#			get_tree().get_root().add_child(bala)
#		
##########################
	Direction.z = clamp(Direction.z, -1,1)
	Direction.x = clamp(Direction.x, -1,1)
	
	if Input.is_action_just_pressed("inv_grab"):
			atirar()
	
	

func _physics_process(delta):
	#Rotation
	
	
	
	if Input.get_mouse_mode()==Input.MOUSE_MODE_CAPTURED:
		Player.rotate_y(deg2rad(-Rotation.x)*delta*MouseSensitivity)
		InnerGimbal.rotate_x(deg2rad(-Rotation.y)*delta*MouseSensitivity)
		InnerGimbal.rotation_degrees.x = clamp(InnerGimbal.rotation_degrees.x, -RotationLimit, RotationLimit)
		Rotation = Vector2()
	
	#Movement
	var MaxSpeed = MovementSpeed *Direction.normalized()
	Speed = Speed.linear_interpolate(MaxSpeed, delta * Acceleration)
	Movement = Player.transform.basis * (Speed)
	CurrentVerticalSpeed.y += gravity * delta * JumpAcceleration
	Movement += CurrentVerticalSpeed
	Player.move_and_slide(Movement,Vector3(0,1,0))
	if Player.is_on_floor() :
		CurrentVerticalSpeed.y = 0
		IsAirborne = false
	
	#Zoom
	ActualZoom = lerp(ActualZoom, ZoomFactor, delta * ZoomSpeed)
	InnerGimbal.set_scale(Vector3(ActualZoom,ActualZoom,ActualZoom))


func atirar():
	var bala = bala1.instance()
	bala.translation=Player.translation
	bala.rotation=Player.get_rotation()
	get_tree().get_root().add_child(bala)
	
