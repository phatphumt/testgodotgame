class_name Player extends CharacterBody2D

@onready var state_machine = $StateMachine
@onready var sprite = $AnimatedSprite2D
var dir: Vector2 = Vector2.ZERO


func _ready():
	state_machine.init(self)


func _physics_process(delta):
	dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	move_and_slide()
	

func turn_dir():
	if dir == Vector2.LEFT:
		sprite.flip_h = true
	
	if dir == Vector2.RIGHT:
		sprite.flip_h = false
