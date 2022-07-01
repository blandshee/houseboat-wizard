extends KinematicBody2D


export var ACCELERATION = 500
export var MAX_SPEED = 80
export var FRICTION = 500
var velocity = Vector2.ZERO

const FireballScene : PackedScene = preload("res://assets/hunt/spells/fireball.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	
	velocity = move_and_slide(velocity)

func _input(event):
	#on click
	if event is InputEventMouseButton:
		#print("Mouse Click/Unclick at: ", event.position)
		#spawn fireball
		fireball()
		
	elif event is InputEventMouseMotion: 
		# set projectile spawn point between player and mouse
		var angle = get_angle_to(get_global_mouse_position())
		$Spawn.position =  Vector2(cos(angle), sin(angle)) * 15
		#print("Mouse Motion at: ", event.position)

func fireball():
	if $Attack1Timer.get_time_left() == 0:
		var b = FireballScene.instance()
		get_parent().add_child(b)
		b.position = $Spawn.global_position
		$Attack1Timer.start()
