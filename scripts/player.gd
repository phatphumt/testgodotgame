class_name Player extends CharacterBody2D

@onready var state_machine = $StateMachine
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
enum Facing {FRONT, BACK, LEFT, RIGHT}

var dir: Vector2 = Vector2.ZERO
var facing: Facing = Facing.FRONT
var attacking: bool = false
var attackable: bool = true


func _ready():
	state_machine.init(self)


func _physics_process(delta):
	dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	move_and_slide()

func turn_dir():
	match dir:
		Vector2.LEFT:
			sprite.flip_h = true
			facing = Facing.LEFT
			sprite.play("side_walk")
		Vector2.RIGHT:
			sprite.flip_h = false
			facing = Facing.RIGHT
			sprite.play("side_walk")
		Vector2.DOWN:
			sprite.flip_h = false
			facing = Facing.FRONT
			sprite.play("front_walk")
		Vector2.UP:
			sprite.flip_h = false
			facing = Facing.BACK
			sprite.play("back_walk")

