class_name StateIdle extends State

@onready var walk_state = %WalkState

func _ready():
	pass	


# Player enters this state
func enter():
	print("idle State!")
	

# Player exits this state
func exit():
	pass


# During Process
func process(_delta: float) -> State:
	return null


func physics(_delta: float) -> State:
	if player.dir != Vector2.ZERO:
		return walk_state
	player.velocity = Vector2.ZERO
	return null


func handle_input(_e: InputEvent) -> State:
	return null
