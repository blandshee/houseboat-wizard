extends Node2D

const SlimeMob : PackedScene = preload("res://assets/hunt/monsters/TestSlime.tscn")
const TreeMob : PackedScene = preload("res://assets/hunt/trees/PineTree.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	
	#populate slimes
	#var x = SlimeMob.instance()
	for n in 8:
		var x = SlimeMob.instance()
		$Objects.add_child(x)
		x.position = Vector2( rand_range(20,300), rand_range(-950, 0) )
		print ("slime created :" + str(x.position) )
		
	for n in 8:
		var x = TreeMob.instance()
		$Objects.add_child(x)
		x.position = Vector2( rand_range(20,300), rand_range(-950, 0) )
		print ("tree created :" + str(x.position) )


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
