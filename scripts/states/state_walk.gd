class_name StateWalk extends State

@export var speed: float = 100.0
@onready var idle_state = %IdleState

func _ready():
	pass


# Player enters this state
func enter():
	print("walking state!!")
	

# Player exits this state
func exit():
	pass


# During Process
func process(_delta: float) -> State:
	return null


func physics(_delta: float) -> State:
	if player.dir == Vector2.ZERO:
		return idle_state
	player.velocity = player.dir * speed
	player.turn_dir()
	return null


func handle_input(_e: InputEvent) -> State:
	return null
