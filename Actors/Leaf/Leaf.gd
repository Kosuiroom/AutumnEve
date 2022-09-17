extends RigidBody2D
class_name leaf

onready var timer = $Timer
onready var rg = RigidBody2D
var is_on_ground := 0

func _ready():
	timer.set_wait_time(1)
	timer.start()

func _process(delta):
#	is_on_ground = get_contact_count() > 0 and int
	pass

func windpush():
	var WindAngle : Vector2
	var angle = rand_range(-100, 100)
	print("angle: ", angle)
	WindAngle = Vector2(angle,-100)
	print("windangle: ", WindAngle)
	apply_central_impulse(WindAngle)


func _on_Timer_timeout():
	print("is on ground: ", is_on_ground)
	if is_on_ground == 0:
		windpush()
	else:
		set_sleeping(true)


func _on_Area2D_body_entered(body):
	print("entered: ", body)
	if body.get_name() == "Leaf":
		print("onground")
		is_on_ground = 1
	
