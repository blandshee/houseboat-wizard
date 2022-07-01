extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 200
export var damage = 1
#export var target = Vector2.ZERO

var trajectory = Vector2.ZERO
var setTemp = false


# Called when the node enters the scene tree for the first time.
func _ready():
	#get_viewport().get_mouse_position()
	# set angle vector
	trajectory = (get_global_mouse_position() - self.global_position ).normalized()
	print(str(get_global_mouse_position()) + " / " + str(get_global_position()) + " / " + str(trajectory))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	#THIS CODE SUCKS: pls make fireballs spawn at the player spawn node
	if self.global_position != Vector2.ZERO && !setTemp:
		trajectory = (get_global_mouse_position() - self.global_position ).normalized()
		setTemp = true
	
	#MOVE TOWARDS TRAJECTORY
	position += trajectory * speed * delta
	rotation_degrees += 10


func _on_Timer_timeout():
	queue_free()


func _on_Fireball_area_entered(area):
	queue_free()
